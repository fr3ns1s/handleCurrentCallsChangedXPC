# handleCurrentCallsChanged XPC

Abusing xpc for to handle call status changes on iOS 
Tested on iPhone 8 , 16.2 (palera1n)  

entitlements (not all necessary):

    <key>com.apple.security.exception.mach-lookup.global-name</key>
    <array>
    <string>com.apple.telephonyutilities.callservicesdaemon.callstatecontroller</string>
    </array>
    <key>com.apple.telephonyutilities.callservicesd</key>
    <array>
    <string>access-collaboration</string>
    <string>modify-status-bar</string>
    <string>modify-call-capabilities</string>
    <string>access-call-capabilities</string>
    <string>access-calls</string>
    <string>modify-calls</string>
    <string>modify-moments</string>
    <string>access-media-priorities</string>
    <string>modify-reports</string>
    <string>access-call-providers</string>
    <string>access-moments</string>
    <string>modify-usernotifications</string>
    </array>

![image](https://github.com/fr3ns1s/handleCurrentCallsChangedXPC/assets/47667961/2132ad6e-d3ef-4e78-8e74-f5641ab3d260)


 reference: [https://cyber.aon.com/aon_cyber_labs/apple-os-x-10-10-security-disclosure-cve-2015-3785-cve-2015-5897/](https://cyber.aon.com/aon_cyber_labs/apple-os-x-10-10-security-disclosure-cve-2015-3785-cve-2015-5897/)
