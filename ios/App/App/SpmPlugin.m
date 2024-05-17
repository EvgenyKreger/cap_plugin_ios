//
//  SpmPlugin.m
//  App
//
//  Created by taqtile on 17.05.24.
//

#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

CAP_PLUGIN(SpmPlugin, "MySpmPlugin", CAP_PLUGIN_METHOD(getModel, CAPPluginReturnPromise);)

