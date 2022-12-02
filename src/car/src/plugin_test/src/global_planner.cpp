#include <angles/angles.h>
#include "global_planner.h"
#include <pluginlib/class_list_macros.h>
#include <tf2/convert.h>
#include <tf2/utils.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <navfn/navfn_ros.h>
#include<math.h>

//register this planner as a BaseGlobalPlanner plugin
PLUGINLIB_EXPORT_CLASS(global_planner::GlobalPlanner, nav_core::BaseGlobalPlanner)

namespace global_planner {

  GlobalPlanner::GlobalPlanner()
  : costmap_ros_(NULL), costmap_(NULL), world_model_(NULL), initialized_(false){}

  GlobalPlanner::GlobalPlanner(std::string name, costmap_2d::Costmap2DROS* costmap_ros)
  : costmap_ros_(NULL), costmap_(NULL), world_model_(NULL), initialized_(false){
    initialize(name, costmap_ros);
  }
  //规划器的名称（name）
  //规划的代价地图（costmap_ros）

  GlobalPlanner::~GlobalPlanner() {
    // deleting a nullptr is a noop
    delete world_model_;
  }
  
  /*
  initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros)是BaseGlobalPlanner的初始化函数，
  用于初始化costmap，参数为用于规划的代价地图（costmap_ros）和规划器的名称(name)。
  */
  void GlobalPlanner::initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros){
    if(!initialized_){
      costmap_ros_ = costmap_ros;
      costmap_ = costmap_ros_->getCostmap();
      global_frame_ = costmap_ros_->getGlobalFrameID();
      up = -2;
      
      ros::NodeHandle private_nh("~/" + name);
      
      private_nh.param("step_size", step_size_, costmap_->getResolution());
      private_nh.param("min_dist_from_robot", min_dist_from_robot_, 0.10);
      world_model_ = new base_local_planner::CostmapModel(*costmap_); 
      plan_pub_ = private_nh.advertise<nav_msgs::Path>("plan", 1);

      initialized_ = true;
    }
    else
      ROS_WARN("This planner has already been initialized... doing nothing");
  }

  //we need to take the footprint of the robot into account when we calculate cost to obstacles
  double GlobalPlanner::footprintCost(double x_i, double y_i, double theta_i){
    if(!initialized_){
      ROS_ERROR("The planner has not been initialized, please call initialize() to use the planner");
      return -1.0;
    }

    std::vector<geometry_msgs::Point> footprint = costmap_ros_->getRobotFootprint();
    //if we have no footprint... do nothing
    if(footprint.size() < 3)
      return -1.0;

    //check if the footprint is legal
    //worldmodel里面有costmap地图。这个函数根据机器人的假设位置x,y,th和机器人的footprintspec计算出cost
    double footprint_cost = world_model_->footprintCost(x_i, y_i, theta_i, footprint);
    return footprint_cost;
  }


  bool GlobalPlanner::makePlan(const geometry_msgs::PoseStamped& start, 
      const geometry_msgs::PoseStamped& goal, std::vector<geometry_msgs::PoseStamped>& plan){

    if(!initialized_){
      ROS_ERROR("The planner has not been initialized, please call initialize() to use the planner");
      return false;
    }

    ROS_DEBUG("Got a start: %.2f, %.2f, and a goal: %.2f, %.2f", start.pose.position.x, start.pose.position.y, goal.pose.position.x, goal.pose.position.y);

    plan.clear();
    costmap_ = costmap_ros_->getCostmap();

    if(goal.header.frame_id != costmap_ros_->getGlobalFrameID()){     //frame_id：用来告诉你，发布的数据是来自哪一个坐标系的
      ROS_ERROR("This planner as configured will only accept goals in the %s frame, but a goal was sent in the %s frame.", 
          costmap_ros_->getGlobalFrameID().c_str(), goal.header.frame_id.c_str());
      return false;
    }

    const double start_yaw = tf2::getYaw(start.pose.orientation);
    const double goal_yaw = tf2::getYaw(goal.pose.orientation);
    ROS_DEBUG("statr point yaw: %.3f,and goal point yaw is %.3f",start_yaw,goal_yaw);
    //we want to step back along the vector created by the robot's position and the goal pose until we find a legal cell
    double goal_x = goal.pose.position.x;
    double goal_y = goal.pose.position.y;
    double start_x = start.pose.position.x;
    double start_y = start.pose.position.y;

    double diff_x = goal_x - start_x;
    double diff_y = goal_y - start_y;
    double diff_yaw = angles::normalize_angle(goal_yaw-start_yaw);

    double target_x = goal_x;
    double target_y = goal_y;
    double target_yaw = goal_yaw;

    bool done = false;
    double scale = 1.0;
    double dScale = 0.01;

    // while(!done)
    // {
    //   if(scale < 0)
    //   {
    //     target_x = start_x;
    //     target_y = start_y;
    //     target_yaw = start_yaw;
    //     ROS_WARN("The carrot planner could not find a valid plan for this goal");
    //     break;
    //   }
    //   target_x = start_x + scale * diff_x;
    //   target_y = start_y + scale * diff_y;
    //   target_yaw = angles::normalize_angle(start_yaw + scale * diff_yaw);
      
    //   double footprint_cost = footprintCost(target_x, target_y, target_yaw);
    //   if(footprint_cost >= 0)
    //   {
    //       done = true;
    //   }
    //   scale -=dScale;
    // }
    // up=0.05;
    plan.push_back(start);

    // int len = 2;
    // ROS_INFO("len is %d",len);
    // for(int i=0;i<len;i++){
      geometry_msgs::PoseStamped test_goal = goal;
    // ros::Time plan_time_1 = ros::Time::now();
    // test_goal.header.stamp = plan_time_1;
    // test_goal.header.frame_id = global_frame_;


      test_goal.pose.position.x = -2;
      test_goal.pose.position.y = 0.5;

      test_goal.pose.orientation.x = 0.0;
      test_goal.pose.orientation.y = 0.0;
      test_goal.pose.orientation.z = 0.0;
      test_goal.pose.orientation.w = 1.0;
      plan.push_back(test_goal);
    //   up = up + 0.05;

    // }
    
    // geometry_msgs::PoseStamped new_goal = goal;
    // tf2::Quaternion goal_quat;
    // // ros::Time plan_time_0 = ros::Time::now();
    // // new_goal.header.stamp = plan_time_1;
    // // new_goal.header.frame_id = global_frame_;
    // goal_quat.setRPY(0, 0, target_yaw);

    // new_goal.pose.position.x = target_x;
    // new_goal.pose.position.y = target_y;

    // new_goal.pose.orientation.x = goal_quat.x();
    // new_goal.pose.orientation.y = goal_quat.y();
    // new_goal.pose.orientation.z = goal_quat.z();
    // new_goal.pose.orientation.w = goal_quat.w();
  //   for (int i=0; i<20; i++){
  //    geometry_msgs::PoseStamped new_goal = goal;
  //    tf2::Quaternion goal_quat ;
  //    goal_quat.setRPY(0, 0, target_yaw);

  //     new_goal.pose.position.x = -2*i*0.01;
  //     new_goal.pose.position.y = -0.3*i*0.01;

  //     new_goal.pose.orientation.x = goal_quat.x();
  //     new_goal.pose.orientation.y = goal_quat.y();
  //     new_goal.pose.orientation.z = goal_quat.z();
  //     new_goal.pose.orientation.w = goal_quat.w();

  //   plan.push_back(new_goal);
  //  }



    // if(pow(goal.pose.position.x-plan[0].pose.position.x,2)+pow(goal.pose.position.y-plan[0].pose.position.y,2)<=1.000){
    //   plan.clear();
    // }
    
    plan.push_back(goal);
    // plan.push_back(new_goal);
    plan[0].pose.orientation = start.pose.orientation;
    plan[plan.size()-1].pose.orientation = goal.pose.orientation;

    nav_msgs::Path path_pose;
    path_pose.header.frame_id = global_frame_;
    path_pose.header.stamp = ros::Time::now();
    path_pose.poses = plan;
    plan_pub_.publish(path_pose);
    ROS_INFO("start point is %f,%f",start.pose.position.x,start.pose.position.y);
    ROS_INFO("goal point is %f,%f",goal.pose.position.x,goal.pose.position.y);
    for(int i = 0;i < plan.size();i++){
      ROS_INFO("No.%d point is %f , %f",i,plan[i].pose.position.x,plan[i].pose.position.y);
    }
    // plan_pub_.publish(plan);
    
    return !(plan.empty());
  }

  void GlobalPlanner::publishPlan(const std::vector<geometry_msgs::PoseStamped>& path, double r, double g, double b, double a){
    if(!initialized_){
      ROS_ERROR("This planner has not been initialized yet, but it is being used, please call initialize() before use");
      return;
    }

    //create a message for the plan 
    nav_msgs::Path gui_path;
    gui_path.poses.resize(path.size());
    
    if(path.empty()) {
      //still set a valid frame so visualization won't hit transform issues
    	gui_path.header.frame_id = global_frame_;
      gui_path.header.stamp = ros::Time::now();
    } else { 
      gui_path.header.frame_id = path[0].header.frame_id;
      gui_path.header.stamp = path[0].header.stamp;
    }

    // Extract the plan in world co-ordinates, we assume the path is all in the same frame
    for(unsigned int i=0; i < path.size(); i++){
      gui_path.poses[i] = path[i];
    }
    
    ROS_DEBUG("this is %d" , path.size());
    plan_pub_.publish(gui_path);
  }
  

};