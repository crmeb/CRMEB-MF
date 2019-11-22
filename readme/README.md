CRMEB-MF是一套基于TP6框架开发的一套后台管理系统
## 系统目录
# app应用目录结构
# 目录结构

## 后台
```
├─app                                     应用目录
│  ├─admin                                  后台模块
│  │   ├─config                                 应用配置目录
│  │   ├─controller                             控制器目录
│  │   ├─model                                  模型目录
│  │   ├─view                                   视图目录
│  │   ├─common.php                             后台公共函数文件
│  │   ├─event.php                              事件注册设置文件
│  │   └─provider.php                           容器
│  ├─api                                    接口模块
│  │   ├─config                                 应用配置目录
│  │   ├─controller                             控制器目录
│  │   ├─middleware                             中间件目录
│  │   ├─validates                              数据验证目录
│  │   ├─ApiExceptionHandle.php                 记录异常文件
│  │   ├─common.php                             函数文件
│  │   ├─event.php                              事件注册设置文件
│  │   └─provider.php                   容器
│  ├─models                             model模块
│  ├─AppService.php
│  ├─common.php                             公共函数文件
│  ├─event.php                              事件注册设置文件
│  ├─ExceptionHandle.php                    异常处理
│  ├─middleware.php 
│  ├─provider.php  
│  ├─Request.php   
│  └─service.php   
├─config                            应用配置目录
├─crmeb                             crmeb核心包 
│  ├─basic                              基础类
│  │   ├─BaseController.php                 控制器基础类
│  │   └─BaseModel.php                      模型基础类
│  ├─command                            命令
│  │   ├─Timer.php                          定时任务
│  │   └─Workerman.php                      长连接服务
│  ├─exceptions                         异常目录
│  │   └─AuthException.php                  授权错误
│  ├─interfaces                         接口
│  │   ├─BehaviorInterface.php   
│  │   ├─JobInterface.php       
│  │   ├─ListenerInterface.php  
│  │   ├─MiddlewareInterface.php
│  │   ├─ProviderInterface.php  
│  │   └─TemplateInterface.php  
│  ├─jobs                           队列任务处理目录
│  │   └─TestJob.php            
│  ├─listeners                      监听事件
│  │   ├─user                   
│  │   │   └─TemplateInterface.php      
│  │   └─Listener.php           
│  ├─repositories                       资源库目录
│  │   └─MessageRepositories.php            消息数据处理
│  ├─services                           服务处理
│  │   ├─storage                            对象存储
│  │   ├─workerman                          定时任务
│  │   ├─ApiLogs.php                        日志和系统字段整合
│  │   ├─CacheService.php                   文件缓存
│  │   ├─ExportService.php                  Excel导出服务
│  │   ├─ExpressService.php                 物流查询接口
│  │   ├─FileService.php                    文件处理
│  │   ├─FormBuilder.php                    后台表单处理
│  │   ├─GroupDataService.php               组合数据处理
│  │   ├─HookService.php                    监听
│  │   ├─HttpService.php                    curl请求
│  │   ├─JsonService.php                    json格式数据返回
│  │   ├─MiniProgramService.php             小程序服务
│  │   ├─MysqlBackupService.php             数据库备份等操作
│  │   ├─PHPExcelService.php                PHPExcel导出服务
│  │   ├─PHPTreeService.php                 PHP生成树形结构,无限多级分类
│  │   ├─ProgramTemplateService.php         小程序模板消息
│  │   ├─QrcodeService.php                  公众号二维码获取
│  │   ├─SMSService.php                     短信服务
│  │   ├─SystemConfigService.php            配置处理
│  │   ├─Template.php                       模板消息
│  │   ├─UpgradeService.php                 升级检测服务
│  │   ├─UploadService.php                  文件上传服务
│  │   ├─UtilService.php                    工具类
│  │   ├─WechatService.php                  公众号服务
│  │   └─WechatTemplateService.php          公众号模板消息
│  ├─subscribes                         事件订阅目录
│  │   ├─MaterialSubscribe.php              素材消息事件
│  │   ├─MessageSubscribe.php               用户消息事件
│  │   ├─OrderSubscribe.php                 订单事件
│  │   ├─ProductSubscribe.php               产品事件
│  │   ├─SystemSubscribe.php                后台系统事件
│  │   ├─TaskSubscribe.php                  定时任务类
│  │   └─UserSubscribe.php                  用户事件
│  ├─traits                               
│  │   ├─CurdControllerTrait.php 
│  │   ├─JwtAuthModelTrait.php   
│  │   ├─LogicTrait.php          
│  │   └─ModelTrait.php          
│  └─utils                              工具类目录
│      └─Json.php                           json类
├─public                                WEB目录（对外访问目录）
│  ├─install                                安装入口文件
│  ├─static                                 静态资源文件
│  ├─system                                 后台静态资源文件
│  ├─uploads                                上传文件
│  ├─index.php                              入口文件
│  ├─router.php                             快速测试文件
│  └─.htaccess                              用于apache的重写
├─route                                 路由定义目录
│  ├─api                                    api模块
│  │   └─route.php                              api模块定义
│  └─app.php                                全局路由定义
├─runtime                               应用的运行时目录
├─vendor                                第三方插件
├─.env                                  数据库配置文件
└─think                                 命令入口文件
```
