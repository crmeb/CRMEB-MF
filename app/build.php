<?php
/**
 * Created by PhpStorm.
 * User: xurongyao <763569752@qq.com>
 * Date: 2019/11/7 6:52 PM
 */
/**
 * 创建模块配置
 * php think build model_name
 */
return [
    // 需要自动创建的文件
    '__file__'   => ['.htaccess','ExecptionHandle.php'],
    // 需要自动创建的目录
    '__dir__'    => ['controller/v1','config','lang','validates/login/','route'],
    // 需要自动控制器类
    'controller' => ['Index'],
    // 需要自动创建的表单验证
    'validates' => ['Index'],
    // 需要自动创建的路由
    'route' => ['route'],
    // 需要自动创建配置文件
    'config'      => ['route'],
    // 需要自动创建的多语言配置文件
    'lang'      => ['zh-CN','en-US'],
    // 需要自动创建的模板
//    'view'       => ['index/index'],
];