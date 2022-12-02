 #include <ros/ros.h>
 #include <costmap_2d/costmap_2d_ros.h>        //路径规划器需要使用    地图类
 #include <costmap_2d/costmap_2d.h>
 #include <nav_core/base_global_planner.h>     //继承nav_core::BaseGlobalPlanner类以便实现我们自己的规划器
 #include <geometry_msgs/PoseStamped.h>        //有hearer和point的信息
 #include <angles/angles.h>                    //此包提供了一组用于处理角度的简单数学实用程序
 #include <base_local_planner/world_model.h>   //轨迹控制器用于与世界交互的接口，无论底层世界模型如何。
 #include <base_local_planner/costmap_model.h>

 using std::string;

 #ifndef GLOBAL_PLANNER_CPP
 #define GLOBAL_PLANNER_CPP

 namespace global_planner {

 class GlobalPlanner : public nav_core::BaseGlobalPlanner {
 public:

  GlobalPlanner();
  GlobalPlanner(std::string name, costmap_2d::Costmap2DROS* costmap_ros);
  ~GlobalPlanner();

  /** overridden classes from interface nav_core::BaseGlobalPlanner **/
  void initialize(std::string name, costmap_2d::Costmap2DROS* costmap_ros);
  bool makePlan(const geometry_msgs::PoseStamped& start,
                const geometry_msgs::PoseStamped& goal,
                std::vector<geometry_msgs::PoseStamped>& plan
               );
  void publishPlan(const std::vector<geometry_msgs::PoseStamped>& path, double r, double g, double b, double a);
private:
      costmap_2d::Costmap2DROS* costmap_ros_;
      double step_size_, min_dist_from_robot_;
      costmap_2d::Costmap2D* costmap_;
      base_local_planner::WorldModel* world_model_; 
      ros::Publisher plan_pub_;
      std::string global_frame_;
      float up;

      double footprintCost(double x_i, double y_i, double theta_i);  //子类将实现此方法，以检查给定位置和方向的足迹，以确定世界上的合法性,当前位姿，继承worldModel类。

      bool initialized_;
    };
  };
  
 #endif
