#!/usr/bin/python
# -*- coding: UTF-8 -*-
# 上面两行不可省略，第一行是：告诉操作系统执行这个脚本的时候，调用 /usr/bin 下的 python 解释器。第二行是：定义编码格式 "UTF-8-" 支持中文

from actionlib.action_client import GoalManager
import rospy 
import tf
import nav_msgs.msg 
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

def active_cb(extra):
    rospy.loginfo("Goal pose being processed")

def feedback_cb(feedback):
    rospy.loginfo("Current location: "+str(feedback))

def done_cb(status, result):
    if status == 3:
        rospy.loginfo("Goal reached")
    if status == 2 or status == 8:
        rospy.loginfo("Goal cancelled")
    if status == 4:
        rospy.loginfo("Goal aborted")
def handle_robot_pose(msg, robotname):
    # if robotname == 'robot2':
    #     pass
    # else:
   
    br = tf.TransformBroadcaster() #将坐标变换广播出去
    #向/tf发布消息
                    #robot距离原点的坐标
    # rospy.loginfo(str(msg.pose.pose.position.x)+"     "+str(msg.pose.pose.position.y))
    br.sendTransform((msg.pose.pose.position.x, msg.pose.pose.position.y, 0), #平移
                    (msg.pose.pose.orientation.x, msg.pose.pose.orientation.y, msg.pose.pose.orientation.z, msg.pose.pose.orientation.w), #旋转  quaternion_from_euler:欧拉角变四元数
                    rospy.Time.now(), #打上时间戳
                    '/%s/odom' % robotname,  #发布 robotname 到 "map" 的平移和翻转   
                    "map")



def send_goals_python():
    client = actionlib.SimpleActionClient('/tb3_0/move_base',MoveBaseAction)
    client.wait_for_server()
    #定义四个发送目标点的对象
    goal0 = MoveBaseGoal()
    goal1 = MoveBaseGoal() 
    goal2 = MoveBaseGoal() 
    goal3 = MoveBaseGoal()
    # 初始化四个目标点在 map 坐标系下的坐标,数据来源于《采集的目标点.docx》
    goal0.target_pose.pose.position.x = -2
    goal0.target_pose.pose.position.y = 0
    goal0.target_pose.pose.orientation.z = 0.001
    goal0.target_pose.pose.orientation.w = 0.01
    
    goal1.target_pose.pose.position.x =-3
    goal1.target_pose.pose.position.y = 2
    goal1.target_pose.pose.orientation.z = 0.1
    goal1.target_pose.pose.orientation.w = 0.1
    
    goal2.target_pose.pose.position.x = -2
    goal2.target_pose.pose.position.y = 0
    goal2.target_pose.pose.orientation.z = 0.1
    goal2.target_pose.pose.orientation.w = 0.1
    
    goal3.target_pose.pose.position.x = -1
    goal3.target_pose.pose.position.y = 0
    goal3.target_pose.pose.orientation.z = 0.1
    goal3.target_pose.pose.orientation.w = 0.1
    
    goal_lists=[goal0, goal1, goal2, goal3]       # 采用 python 中的列表方式，替代实现C/C++ 中的数组概念 
    goal_number = 4     # total is 4 goals
    while(goal_number): 
       
        goal_lists[0].target_pose.header.frame_id = "map"
        goal_lists[0].target_pose.header.stamp = rospy.Time.now()
        client.send_goal( goal_lists[0])
        str_log = "Send NO. %s Goal !!!" %str(0)
        rospy.loginfo(str_log)     
        # if(4 - goal_number ==0):
        #     goal_lists[4-goal_number].target_pose.header.frame_id = "map"
        #     goal_lists[4-goal_number].target_pose.header.stamp = rospy.Time.now()
        #     client.send_goal( goal_lists[4-goal_number])
        #     str_log = "Send NO. %s Goal !!!" %str(4-goal_number)
        #     rospy.loginfo(str_log)
        # elif(4 - goal_number ==1):
        #     goal_lists[4-goal_number].target_pose.header.frame_id = "map"
        #     goal_lists[4-goal_number].target_pose.header.stamp = rospy.Time.now()
        #     client.send_goal( goal_lists[4-goal_number])
        #     str_log = "Send NO. %s Goal !!!" %str(4-goal_number)
        #     rospy.loginfo(str_log)
        # elif(4 - goal_number ==2):
        #     goal_lists[4-goal_number].target_pose.header.frame_id = "map"
        #     goal_lists[4-goal_number].target_pose.header.stamp = rospy.Time.now()
        #     client.send_goal( goal_lists[4-goal_number])
        #     str_log = "Send NO. %s Goal !!!" %str(4-goal_number)
        #     rospy.loginfo(str_log)
        # elif(4 - goal_number ==3):
        #     goal_lists[4-goal_number].target_pose.header.frame_id = "map"
        #     goal_lists[4-goal_number].target_pose.header.stamp = rospy.Time.now()
        #     client.send_goal( goal_lists[4-goal_number])
        #     str_log = "Send NO. %s Goal !!!" %str(4-goal_number)
        #     rospy.loginfo(str_log)

        wait = client.wait_for_result(rospy.Duration.from_sec(60.0))  # 发送完毕目标点之后，根据action 的机制，等待反馈执行的状态，等待时长是：30 s.
        if not wait:
            str_log="The NO. %s Goal Planning Failed for some reasons" %str(4-goal_number)
            rospy.loginfo(str_log)
            goal_number = goal_number - 1  # 等待超时之后 准备发送下一个目标点，action server 会自动执行最新的请求.
            continue
        else:
            str_log="The NO. %s Goal achieved success !!!" %str(4-goal_number)
            rospy.loginfo(str_log)
            goal_number = goal_number - 1
    return "Mission Finished."




if __name__ == '__main__':
        rospy.init_node('send_goals_python',anonymous=True)    # python 语言方式下的　初始化 ROS 节点，
        
        result = send_goals_python()
        rospy.loginfo(result)
