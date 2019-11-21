<?php

use think\facade\Route;


//会员授权接口
Route::group(function () {
})->middleware(\app\api\middleware\AllowOriginMiddleware::class)->middleware(\app\api\middleware\AuthTokenMiddleware::class, true);
//未授权接口
Route::group(function () {
    //公共类
    Route::get('index', 'PublicController/index')->name('index');//首页

    //微信
    Route::get('wechat/config', 'wechat.WechatController/config')->name('wechatConfig');//微信 sdk 配置
    Route::get('wechat/auth', 'wechat.WechatController/auth')->name('wechatAuth');//微信授权


})->middleware(\app\api\middleware\AllowOriginMiddleware::class)->middleware(\app\api\middleware\AuthTokenMiddleware::class, false);


Route::miss(function() {
    if(app()->request->isOptions())
        return \think\Response::create('ok')->code(200)->header([
            'Access-Control-Allow-Origin'   => '*',
            'Access-Control-Allow-Headers'  => 'Authori-zation,Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-Requested-With',
            'Access-Control-Allow-Methods'  => 'GET,POST,PATCH,PUT,DELETE,OPTIONS,DELETE',
        ]);
    else
        return \think\Response::create()->code(404);
});