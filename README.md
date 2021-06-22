

# 6.23

1.朋友圈右侧按钮进入发布界面

2.内容为0时，发布按钮不可用，颜色为灰色

3.文字为0时，显示自定义的Placeholder

4.输入文字，文字长度不为0，不显示Placeholder

5.整个发布界面基于UIScrollview，滑动时停止TextView编辑

# 6.21

1.新增登出时弹窗警告（UIAlertController）

2.去掉多余的分割线（TableVIew）

3.完善注释

# 6.20

失踪人口回归？鸽太久了，终于想起来做这个了。。。。

1.新增本地伪登录（NSUserdefault）

2.新增换头像功能，并且存储到本地，保留，并加载（NSFileManager）



# 5.13 

1. 使用了Masonry进行布局，不再使用祖传Frame，目前可以实现基本屏幕适配（启动界面还有一点问题）
2. Cell的XIB使用AutoLayout，确保不同屏幕宽度情况下，UI控件的正常显示
3. 规范了代码与注释