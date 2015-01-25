.class Lcom/android/server/ServerThread;
.super Ljava/lang/Thread;
.source "SystemServer.java"


# static fields
.field private static final ENCRYPTED_STATE:Ljava/lang/String; = "1"

.field private static final ENCRYPTING_STATE:Ljava/lang/String; = "trigger_restart_min_framework"

.field private static final TAG:Ljava/lang/String; = "SystemServer"


# instance fields
.field mContentResolver:Landroid/content/ContentResolver;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method static final startSystemUi(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    .line 1047
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1048
    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1050
    const-string v1, "SystemServer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Starting service: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1051
    sget-object v1, Landroid/os/UserHandle;->OWNER:Landroid/os/UserHandle;

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->startServiceAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/ComponentName;

    .line 1052
    return-void
.end method


# virtual methods
.method reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .parameter "msg"
    .parameter "e"

    .prologue
    .line 87
    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    const-string v0, "SystemServer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BOOT FAILURE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    return-void
.end method

.method public run()V
    .locals 152

    .prologue
    .line 93
    const/16 v5, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-static {v5, v0, v1}, Landroid/util/EventLog;->writeEvent(IJ)I

    .line 96
    invoke-static {}, Landroid/os/Looper;->prepareMainLooper()V

    .line 98
    const/4 v5, -0x2

    invoke-static {v5}, Landroid/os/Process;->setThreadPriority(I)V

    .line 101
    const/4 v5, 0x1

    invoke-static {v5}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    .line 102
    const/4 v5, 0x0

    invoke-static {v5}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 106
    const-string v5, "sys.shutdown.requested"

    const-string v6, ""

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v125

    .line 108
    .local v125, shutdownAction:Ljava/lang/String;
    if-eqz v125, :cond_0

    invoke-virtual/range {v125 .. v125}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    .line 109
    const/4 v5, 0x0

    move-object/from16 v0, v125

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x31

    if-ne v5, v6, :cond_11

    const/16 v118, 0x1

    .line 112
    .local v118, reboot:Z
    :goto_0
    invoke-virtual/range {v125 .. v125}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_12

    .line 113
    const/4 v5, 0x1

    invoke-virtual/range {v125 .. v125}, Ljava/lang/String;->length()I

    move-result v6

    move-object/from16 v0, v125

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v117

    .line 117
    .local v117, reason:Ljava/lang/String;
    :goto_1
    const-string v5, "SystemServer"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "shutdown : ServerThread   reboot = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, v118

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, "   reason = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v117

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    move/from16 v0, v118

    move-object/from16 v1, v117

    invoke-static {v0, v1}, Lcom/android/server/power/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 122
    .end local v117           #reason:Ljava/lang/String;
    .end local v118           #reboot:Z
    :cond_0
    const-string v5, "ro.factorytest"

    invoke-static {v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v92

    .line 123
    .local v92, factoryTestStr:Ljava/lang/String;
    const-string v5, ""

    move-object/from16 v0, v92

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    const/16 v91, 0x0

    .line 125
    .local v91, factoryTest:I
    :goto_2
    const-string v5, "1"

    const-string v6, "ro.config.headless"

    const-string v8, "0"

    invoke-static {v6, v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    .line 127
    .local v34, headless:Z
    const/16 v97, 0x0

    .line 128
    .local v97, installer:Lcom/android/server/pm/Installer;
    const/16 v61, 0x0

    .line 129
    .local v61, accountManager:Landroid/accounts/AccountManagerService;
    const/16 v78, 0x0

    .line 130
    .local v78, contentService:Landroid/content/ContentService;
    const/16 v100, 0x0

    .line 131
    .local v100, lights:Lcom/android/server/LightsService;
    const/16 v116, 0x0

    .line 132
    .local v116, power:Lcom/android/server/power/PowerManagerService;
    const/16 v84, 0x0

    .line 133
    .local v84, display:Lcom/android/server/display/DisplayManagerService;
    const/16 v67, 0x0

    .line 134
    .local v67, battery:Lcom/android/server/BatteryService;
    const/16 v141, 0x0

    .line 135
    .local v141, vibrator:Lcom/android/server/VibratorService;
    const/16 v63, 0x0

    .line 136
    .local v63, alarm:Lcom/android/server/AlarmManagerService;
    const/16 v106, 0x0

    .line 137
    .local v106, mountService:Lcom/android/server/MountService;
    const/16 v31, 0x0

    .line 138
    .local v31, networkManagement:Lcom/android/server/NetworkManagementService;
    const/16 v30, 0x0

    .line 139
    .local v30, networkStats:Lcom/android/server/net/NetworkStatsService;
    const/16 v108, 0x0

    .line 140
    .local v108, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    const/16 v75, 0x0

    .line 141
    .local v75, connectivity:Lcom/android/server/ConnectivityService;
    const/16 v148, 0x0

    .line 142
    .local v148, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    const/16 v146, 0x0

    .line 143
    .local v146, wifi:Lcom/android/server/WifiService;
    const/16 v123, 0x0

    .line 144
    .local v123, serviceDiscovery:Lcom/android/server/NsdService;
    const/16 v115, 0x0

    .line 145
    .local v115, pm:Landroid/content/pm/IPackageManager;
    const/4 v13, 0x0

    .line 146
    .local v13, context:Landroid/content/Context;
    const/16 v150, 0x0

    .line 147
    .local v150, wm:Lcom/android/server/wm/WindowManagerService;
    const/16 v68, 0x0

    .line 148
    .local v68, bluetooth:Lcom/android/server/BluetoothManagerService;
    const/16 v85, 0x0

    .line 149
    .local v85, dock:Lcom/android/server/DockObserver;
    const/16 v139, 0x0

    .line 150
    .local v139, usb:Lcom/android/server/usb/UsbService;
    const/16 v121, 0x0

    .line 151
    .local v121, serial:Lcom/android/server/SerialService;
    const/16 v134, 0x0

    .line 152
    .local v134, twilight:Lcom/android/server/TwilightService;
    const/16 v137, 0x0

    .line 153
    .local v137, uiMode:Lcom/android/server/UiModeManagerService;
    const/16 v119, 0x0

    .line 154
    .local v119, recognition:Lcom/android/server/RecognitionManagerService;
    const/16 v130, 0x0

    .line 155
    .local v130, throttle:Lcom/android/server/ThrottleService;
    const/16 v110, 0x0

    .line 156
    .local v110, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    const/16 v72, 0x0

    .line 157
    .local v72, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    const/16 v96, 0x0

    .line 158
    .local v96, inputManager:Lcom/android/server/input/InputManagerService;
    const/16 v128, 0x0

    .line 165
    .local v128, telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    new-instance v136, Landroid/os/HandlerThread;

    const-string v5, "UI"

    move-object/from16 v0, v136

    invoke-direct {v0, v5}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 166
    .local v136, uiHandlerThread:Landroid/os/HandlerThread;
    invoke-virtual/range {v136 .. v136}, Ljava/lang/Thread;->start()V

    .line 167
    new-instance v21, Landroid/os/Handler;

    invoke-virtual/range {v136 .. v136}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v5

    move-object/from16 v0, v21

    invoke-direct {v0, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 168
    .local v21, uiHandler:Landroid/os/Handler;
    new-instance v5, Lcom/android/server/ServerThread$1;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 185
    new-instance v151, Landroid/os/HandlerThread;

    const-string v5, "WindowManager"

    move-object/from16 v0, v151

    invoke-direct {v0, v5}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 186
    .local v151, wmHandlerThread:Landroid/os/HandlerThread;
    invoke-virtual/range {v151 .. v151}, Ljava/lang/Thread;->start()V

    .line 187
    new-instance v22, Landroid/os/Handler;

    invoke-virtual/range {v151 .. v151}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v5

    move-object/from16 v0, v22

    invoke-direct {v0, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 188
    .local v22, wmHandler:Landroid/os/Handler;
    new-instance v5, Lcom/android/server/ServerThread$2;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/android/server/ServerThread$2;-><init>(Lcom/android/server/ServerThread;)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 205
    const/16 v25, 0x0

    .line 210
    .local v25, onlyCore:Z
    :try_start_0
    const-string v5, "SystemServer"

    const-string v6, "Waiting for installd to be ready."

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    new-instance v98, Lcom/android/server/pm/Installer;

    invoke-direct/range {v98 .. v98}, Lcom/android/server/pm/Installer;-><init>()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_50

    .line 212
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .local v98, installer:Lcom/android/server/pm/Installer;
    :try_start_1
    invoke-virtual/range {v98 .. v98}, Lcom/android/server/pm/Installer;->ping()Z

    .line 214
    const-string v5, "SystemServer"

    const-string v6, "Entropy Mixer"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    const-string v5, "entropy"

    new-instance v6, Lcom/android/server/EntropyMixer;

    invoke-direct {v6}, Lcom/android/server/EntropyMixer;-><init>()V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 217
    const-string v5, "SystemServer"

    const-string v6, "Power Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    new-instance v15, Lcom/android/server/power/PowerManagerService;

    invoke-direct {v15}, Lcom/android/server/power/PowerManagerService;-><init>()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_51

    .line 219
    .end local v116           #power:Lcom/android/server/power/PowerManagerService;
    .local v15, power:Lcom/android/server/power/PowerManagerService;
    :try_start_2
    const-string v5, "power"

    invoke-static {v5, v15}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 221
    const-string v5, "SystemServer"

    const-string v6, "Activity Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    invoke-static/range {v91 .. v91}, Lcom/android/server/am/ActivityManagerService;->main(I)Landroid/content/Context;

    move-result-object v13

    .line 224
    const-string v5, "SystemServer"

    const-string v6, "Display Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    new-instance v11, Lcom/android/server/display/DisplayManagerService;

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-direct {v11, v13, v0, v1}, Lcom/android/server/display/DisplayManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;Landroid/os/Handler;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_52

    .line 226
    .end local v84           #display:Lcom/android/server/display/DisplayManagerService;
    .local v11, display:Lcom/android/server/display/DisplayManagerService;
    :try_start_3
    const-string v5, "display"

    const/4 v6, 0x1

    invoke-static {v5, v11, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;Z)V

    .line 228
    const-string v5, "SystemServer"

    const-string v6, "Telephony Registry"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    new-instance v129, Lcom/android/server/TelephonyRegistry;

    move-object/from16 v0, v129

    invoke-direct {v0, v13}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_53

    .line 230
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .local v129, telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :try_start_4
    const-string v5, "telephony.registry"

    move-object/from16 v0, v129

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 232
    const-string v5, "SystemServer"

    const-string v6, "Scheduling Policy"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    const-string v5, "scheduling_policy"

    new-instance v6, Landroid/os/SchedulingPolicyService;

    invoke-direct {v6}, Landroid/os/SchedulingPolicyService;-><init>()V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 236
    invoke-static {v13}, Lcom/android/server/AttributeCache;->init(Landroid/content/Context;)V

    .line 238
    invoke-virtual {v11}, Lcom/android/server/display/DisplayManagerService;->waitForDefaultDisplay()Z

    move-result v5

    if-nez v5, :cond_1

    .line 239
    const-string v5, "Timeout waiting for default display to be initialized."

    new-instance v6, Ljava/lang/Throwable;

    invoke-direct {v6}, Ljava/lang/Throwable;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 243
    :cond_1
    const-string v5, "SystemServer"

    const-string v6, "Package Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    const-string v5, "vold.decrypt"

    invoke-static {v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v81

    .line 246
    .local v81, cryptState:Ljava/lang/String;
    const-string v5, "trigger_restart_min_framework"

    move-object/from16 v0, v81

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 247
    const-string v5, "SystemServer"

    const-string v6, "Detected encryption in progress - only parsing core apps"

    invoke-static {v5, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    const/16 v25, 0x1

    .line 254
    :cond_2
    :goto_3
    if-eqz v91, :cond_15

    const/4 v5, 0x1

    :goto_4
    move-object/from16 v0, v98

    move/from16 v1, v25

    invoke-static {v13, v0, v5, v1}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;Lcom/android/server/pm/Installer;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_1

    move-result-object v115

    .line 257
    const/16 v93, 0x0

    .line 259
    .local v93, firstBoot:Z
    :try_start_5
    invoke-interface/range {v115 .. v115}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_39
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_1

    move-result v93

    .line 262
    :goto_5
    const/16 v124, 0x0

    .line 263
    .local v124, setRTC:Z
    :try_start_6
    const-string v5, "persist.sys.setrtc"

    const/4 v6, 0x1

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v124

    .line 264
    if-eqz v124, :cond_3

    .line 265
    const-string v5, "SystemServer"

    const-string v6, "Set Default Time"

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    const-string v5, "persist.sys.setrtc"

    const-string v6, "false"

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    new-instance v4, Landroid/text/format/Time;

    invoke-static {}, Landroid/text/format/Time;->getCurrentTimezone()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/text/format/Time;-><init>(Ljava/lang/String;)V

    .line 268
    .local v4, today:Landroid/text/format/Time;
    const/16 v5, 0x7dd

    iput v5, v4, Landroid/text/format/Time;->year:I

    .line 269
    const/4 v5, 0x0

    iput v5, v4, Landroid/text/format/Time;->month:I

    .line 270
    const/4 v5, 0x1

    iput v5, v4, Landroid/text/format/Time;->monthDay:I

    .line 271
    const/16 v5, 0xc

    iput v5, v4, Landroid/text/format/Time;->hour:I

    .line 272
    const/4 v5, 0x0

    iput v5, v4, Landroid/text/format/Time;->minute:I

    .line 273
    const/4 v5, 0x0

    iput v5, v4, Landroid/text/format/Time;->second:I

    .line 274
    iget v5, v4, Landroid/text/format/Time;->second:I

    iget v6, v4, Landroid/text/format/Time;->minute:I

    iget v7, v4, Landroid/text/format/Time;->hour:I

    iget v8, v4, Landroid/text/format/Time;->monthDay:I

    iget v9, v4, Landroid/text/format/Time;->month:I

    iget v10, v4, Landroid/text/format/Time;->year:I

    invoke-virtual/range {v4 .. v10}, Landroid/text/format/Time;->set(IIIIII)V

    .line 275
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v5

    invoke-static {v5, v6}, Landroid/os/SystemClock;->setCurrentTimeMillis(J)Z

    .line 278
    .end local v4           #today:Landroid/text/format/Time;
    :cond_3
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    .line 280
    const-string v5, "SystemServer"

    const-string v6, "User Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    const-string v5, "user"

    invoke-static {}, Lcom/android/server/pm/UserManagerService;->getInstance()Lcom/android/server/pm/UserManagerService;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 285
    invoke-virtual {v13}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_1

    .line 289
    :try_start_7
    const-string v5, "SystemServer"

    const-string v6, "Account Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    new-instance v62, Landroid/accounts/AccountManagerService;

    move-object/from16 v0, v62

    invoke-direct {v0, v13}, Landroid/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_1

    .line 291
    .end local v61           #accountManager:Landroid/accounts/AccountManagerService;
    .local v62, accountManager:Landroid/accounts/AccountManagerService;
    :try_start_8
    const-string v5, "account"

    move-object/from16 v0, v62

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_5a
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_54

    move-object/from16 v61, v62

    .line 296
    .end local v62           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v61       #accountManager:Landroid/accounts/AccountManagerService;
    :goto_6
    :try_start_9
    const-string v5, "SystemServer"

    const-string v6, "Content Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    const/4 v5, 0x1

    move/from16 v0, v91

    if-ne v0, v5, :cond_16

    const/4 v5, 0x1

    :goto_7
    invoke-static {v13, v5}, Landroid/content/ContentService;->main(Landroid/content/Context;Z)Landroid/content/ContentService;

    move-result-object v78

    .line 300
    const-string v5, "SystemServer"

    const-string v6, "System Content Providers"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->installSystemProviders()V

    .line 303
    const-string v5, "SystemServer"

    const-string v6, "Lights Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    new-instance v7, Lcom/android/server/LightsService;

    invoke-direct {v7, v13}, Lcom/android/server/LightsService;-><init>(Landroid/content/Context;)V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_1

    .line 306
    .end local v100           #lights:Lcom/android/server/LightsService;
    .local v7, lights:Lcom/android/server/LightsService;
    :try_start_a
    const-string v5, "SystemServer"

    const-string v6, "Battery Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    new-instance v9, Lcom/android/server/BatteryService;

    invoke-direct {v9, v13, v7}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;Lcom/android/server/LightsService;)V
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_55

    .line 308
    .end local v67           #battery:Lcom/android/server/BatteryService;
    .local v9, battery:Lcom/android/server/BatteryService;
    :try_start_b
    const-string v5, "battery"

    invoke-static {v5, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 310
    const-string v5, "SystemServer"

    const-string v6, "Vibrator Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    new-instance v142, Lcom/android/server/VibratorService;

    move-object/from16 v0, v142

    invoke-direct {v0, v13}, Lcom/android/server/VibratorService;-><init>(Landroid/content/Context;)V
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_56

    .line 312
    .end local v141           #vibrator:Lcom/android/server/VibratorService;
    .local v142, vibrator:Lcom/android/server/VibratorService;
    :try_start_c
    const-string v5, "vibrator"

    move-object/from16 v0, v142

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 316
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v8

    invoke-static {}, Lcom/android/server/am/BatteryStatsService;->getService()Lcom/android/internal/app/IBatteryStats;

    move-result-object v10

    move-object v5, v15

    move-object v6, v13

    invoke-virtual/range {v5 .. v11}, Lcom/android/server/power/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Lcom/android/server/am/ActivityManagerService;Lcom/android/server/BatteryService;Lcom/android/internal/app/IBatteryStats;Lcom/android/server/display/DisplayManagerService;)V

    .line 319
    const-string v5, "SystemServer"

    const-string v6, "Alarm Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    new-instance v16, Lcom/android/server/AlarmManagerService;

    move-object/from16 v0, v16

    invoke-direct {v0, v13}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_57

    .line 321
    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .local v16, alarm:Lcom/android/server/AlarmManagerService;
    :try_start_d
    const-string v5, "alarm"

    move-object/from16 v0, v16

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 323
    const-string v5, "SystemServer"

    const-string v6, "Init Watchdog"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v12

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v17

    move-object v14, v9

    invoke-virtual/range {v12 .. v17}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/power/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V

    .line 327
    const-string v5, "SystemServer"

    const-string v6, "Input Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    new-instance v20, Lcom/android/server/input/InputManagerService;

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-direct {v0, v13, v1}, Lcom/android/server/input/InputManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V
    :try_end_d
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_58

    .line 330
    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .local v20, inputManager:Lcom/android/server/input/InputManagerService;
    :try_start_e
    const-string v5, "SystemServer"

    const-string v6, "Window Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    const/4 v5, 0x1

    move/from16 v0, v91

    if-eq v0, v5, :cond_17

    const/16 v23, 0x1

    :goto_8
    if-nez v93, :cond_18

    const/16 v24, 0x1

    :goto_9
    move-object/from16 v17, v13

    move-object/from16 v18, v15

    move-object/from16 v19, v11

    invoke-static/range {v17 .. v25}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/power/PowerManagerService;Lcom/android/server/display/DisplayManagerService;Lcom/android/server/input/InputManagerService;Landroid/os/Handler;Landroid/os/Handler;ZZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v150

    .line 335
    const-string v5, "window"

    move-object/from16 v0, v150

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 336
    const-string v5, "input"

    move-object/from16 v0, v20

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 338
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v5

    move-object/from16 v0, v150

    invoke-virtual {v5, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    .line 340
    invoke-virtual/range {v150 .. v150}, Lcom/android/server/wm/WindowManagerService;->getInputMonitor()Lcom/android/server/wm/InputMonitor;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Lcom/android/server/input/InputManagerService;->setWindowManagerCallbacks(Lcom/android/server/input/InputManagerService$WindowManagerCallbacks;)V

    .line 341
    invoke-virtual/range {v20 .. v20}, Lcom/android/server/input/InputManagerService;->start()V

    .line 343
    move-object/from16 v0, v150

    invoke-virtual {v11, v0}, Lcom/android/server/display/DisplayManagerService;->setWindowManager(Lcom/android/server/display/DisplayManagerService$WindowManagerFuncs;)V

    .line 344
    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lcom/android/server/display/DisplayManagerService;->setInputManager(Lcom/android/server/display/DisplayManagerService$InputManagerFuncs;)V

    .line 349
    const-string v5, "ro.kernel.qemu"

    invoke-static {v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    .line 350
    const-string v5, "SystemServer"

    const-string v6, "No Bluetooh Service (emulator)"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_e} :catch_2

    :goto_a
    move-object/from16 v128, v129

    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v141, v142

    .end local v142           #vibrator:Lcom/android/server/VibratorService;
    .restart local v141       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v97, v98

    .line 364
    .end local v81           #cryptState:Ljava/lang/String;
    .end local v93           #firstBoot:Z
    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .end local v124           #setRTC:Z
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    :goto_b
    const/16 v82, 0x0

    .line 365
    .local v82, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    const/16 v126, 0x0

    .line 366
    .local v126, statusBar:Lcom/android/server/StatusBarManagerService;
    const/16 v94, 0x0

    .line 367
    .local v94, imm:Lcom/android/server/InputMethodManagerService;
    const/16 v64, 0x0

    .line 368
    .local v64, appWidget:Lcom/android/server/AppWidgetService;
    const/16 v112, 0x0

    .line 369
    .local v112, notification:Lcom/android/server/NotificationManagerService;
    const/16 v144, 0x0

    .line 370
    .local v144, wallpaper:Lcom/android/server/WallpaperManagerService;
    const/16 v101, 0x0

    .line 371
    .local v101, location:Lcom/android/server/LocationManagerService;
    const/16 v79, 0x0

    .line 372
    .local v79, countryDetector:Lcom/android/server/CountryDetectorService;
    const/16 v132, 0x0

    .line 373
    .local v132, tsms:Lcom/android/server/TextServicesManagerService;
    const/16 v103, 0x0

    .line 374
    .local v103, lockSettings:Lcom/android/internal/widget/LockSettingsService;
    const/16 v87, 0x0

    .line 377
    .local v87, dreamy:Lcom/android/server/dreams/DreamManagerService;
    const/4 v5, 0x1

    move/from16 v0, v91

    if-eq v0, v5, :cond_4

    .line 379
    :try_start_f
    const-string v5, "SystemServer"

    const-string v6, "Input Method Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    new-instance v95, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v95

    move-object/from16 v1, v150

    invoke-direct {v0, v13, v1}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_f
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_3

    .line 381
    .end local v94           #imm:Lcom/android/server/InputMethodManagerService;
    .local v95, imm:Lcom/android/server/InputMethodManagerService;
    :try_start_10
    const-string v5, "input_method"

    move-object/from16 v0, v95

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_10} :catch_4f

    move-object/from16 v94, v95

    .line 387
    .end local v95           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v94       #imm:Lcom/android/server/InputMethodManagerService;
    :goto_c
    :try_start_11
    const-string v5, "SystemServer"

    const-string v6, "Accessibility Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 388
    const-string v5, "accessibility"

    new-instance v6, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v6, v13}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_11} :catch_4

    .line 396
    :cond_4
    :goto_d
    :try_start_12
    invoke-virtual/range {v150 .. v150}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_12
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_12} :catch_5

    .line 402
    :goto_e
    :try_start_13
    invoke-interface/range {v115 .. v115}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_13
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_13} :catch_6

    .line 408
    :goto_f
    :try_start_14
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v5

    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v8, 0x10403ee

    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    const/4 v8, 0x0

    invoke-interface {v5, v6, v8}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_14
    .catch Landroid/os/RemoteException; {:try_start_14 .. :try_end_14} :catch_4e

    .line 415
    :goto_10
    const/4 v5, 0x1

    move/from16 v0, v91

    if-eq v0, v5, :cond_1c

    .line 416
    const-string v5, "0"

    const-string v6, "system_init.startmountservice"

    invoke-static {v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 422
    :try_start_15
    const-string v5, "SystemServer"

    const-string v6, "Mount Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    new-instance v107, Lcom/android/server/MountService;

    move-object/from16 v0, v107

    invoke-direct {v0, v13}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_15} :catch_7

    .line 424
    .end local v106           #mountService:Lcom/android/server/MountService;
    .local v107, mountService:Lcom/android/server/MountService;
    :try_start_16
    const-string v5, "mount"

    move-object/from16 v0, v107

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_16
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_16} :catch_4d

    move-object/from16 v106, v107

    .line 431
    .end local v107           #mountService:Lcom/android/server/MountService;
    .restart local v106       #mountService:Lcom/android/server/MountService;
    :cond_5
    :goto_11
    :try_start_17
    const-string v5, "SystemServer"

    const-string v6, "LockSettingsService"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    new-instance v104, Lcom/android/internal/widget/LockSettingsService;

    move-object/from16 v0, v104

    invoke-direct {v0, v13}, Lcom/android/internal/widget/LockSettingsService;-><init>(Landroid/content/Context;)V
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_17 .. :try_end_17} :catch_8

    .line 433
    .end local v103           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .local v104, lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :try_start_18
    const-string v5, "lock_settings"

    move-object/from16 v0, v104

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_18
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_18} :catch_4c

    move-object/from16 v103, v104

    .line 439
    .end local v104           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v103       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :goto_12
    :try_start_19
    const-string v5, "SystemServer"

    const-string v6, "Device Policy"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    new-instance v83, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v83

    invoke-direct {v0, v13}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_19} :catch_9

    .line 441
    .end local v82           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .local v83, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :try_start_1a
    const-string v5, "device_policy"

    move-object/from16 v0, v83

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_1a} :catch_4b

    move-object/from16 v82, v83

    .line 447
    .end local v83           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v82       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :goto_13
    :try_start_1b
    const-string v5, "SystemServer"

    const-string v6, "Status Bar"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    new-instance v127, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v127

    move-object/from16 v1, v150

    invoke-direct {v0, v13, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_1b
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_1b} :catch_a

    .line 449
    .end local v126           #statusBar:Lcom/android/server/StatusBarManagerService;
    .local v127, statusBar:Lcom/android/server/StatusBarManagerService;
    :try_start_1c
    const-string v5, "statusbar"

    move-object/from16 v0, v127

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1c
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_4a

    move-object/from16 v126, v127

    .line 455
    .end local v127           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v126       #statusBar:Lcom/android/server/StatusBarManagerService;
    :goto_14
    :try_start_1d
    const-string v5, "SystemServer"

    const-string v6, "Clipboard Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    const-string v5, "clipboard"

    new-instance v6, Lcom/android/server/ClipboardService;

    invoke-direct {v6, v13}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1d
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_1d} :catch_b

    .line 463
    :goto_15
    :try_start_1e
    const-string v5, "SystemServer"

    const-string v6, "NetworkManagement Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    invoke-static {v13}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v31

    .line 465
    const-string v5, "network_management"

    move-object/from16 v0, v31

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_1e .. :try_end_1e} :catch_c

    .line 471
    :goto_16
    :try_start_1f
    const-string v5, "SystemServer"

    const-string v6, "Text Service Manager Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    new-instance v133, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v133

    invoke-direct {v0, v13}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_1f .. :try_end_1f} :catch_d

    .line 473
    .end local v132           #tsms:Lcom/android/server/TextServicesManagerService;
    .local v133, tsms:Lcom/android/server/TextServicesManagerService;
    :try_start_20
    const-string v5, "textservices"

    move-object/from16 v0, v133

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_20} :catch_49

    move-object/from16 v132, v133

    .line 479
    .end local v133           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v132       #tsms:Lcom/android/server/TextServicesManagerService;
    :goto_17
    :try_start_21
    const-string v5, "SystemServer"

    const-string v6, "NetworkStats Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    new-instance v109, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v109

    move-object/from16 v1, v31

    move-object/from16 v2, v16

    invoke-direct {v0, v13, v1, v2}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_21
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_21} :catch_e

    .line 481
    .end local v30           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .local v109, networkStats:Lcom/android/server/net/NetworkStatsService;
    :try_start_22
    const-string v5, "netstats"

    move-object/from16 v0, v109

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_22} :catch_48

    move-object/from16 v30, v109

    .line 487
    .end local v109           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v30       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :goto_18
    :try_start_23
    const-string v5, "SystemServer"

    const-string v6, "NetworkPolicy Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    new-instance v26, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v28

    move-object/from16 v27, v13

    move-object/from16 v29, v15

    invoke-direct/range {v26 .. v31}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_23
    .catch Ljava/lang/Throwable; {:try_start_23 .. :try_end_23} :catch_f

    .line 491
    .end local v108           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .local v26, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    :try_start_24
    const-string v5, "netpolicy"

    move-object/from16 v0, v26

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_24} :catch_47

    .line 497
    :goto_19
    :try_start_25
    const-string v5, "SystemServer"

    const-string v6, "Wi-Fi P2pService"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    new-instance v149, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v149

    invoke-direct {v0, v13}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_25
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_25} :catch_10

    .line 499
    .end local v148           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .local v149, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :try_start_26
    const-string v5, "wifip2p"

    move-object/from16 v0, v149

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_26
    .catch Ljava/lang/Throwable; {:try_start_26 .. :try_end_26} :catch_46

    move-object/from16 v148, v149

    .line 505
    .end local v149           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v148       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :goto_1a
    :try_start_27
    const-string v5, "SystemServer"

    const-string v6, "Wi-Fi Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    new-instance v147, Lcom/android/server/WifiService;

    move-object/from16 v0, v147

    invoke-direct {v0, v13}, Lcom/android/server/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_27} :catch_11

    .line 507
    .end local v146           #wifi:Lcom/android/server/WifiService;
    .local v147, wifi:Lcom/android/server/WifiService;
    :try_start_28
    const-string v5, "wifi"

    move-object/from16 v0, v147

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_28
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_28} :catch_45

    move-object/from16 v146, v147

    .line 513
    .end local v147           #wifi:Lcom/android/server/WifiService;
    .restart local v146       #wifi:Lcom/android/server/WifiService;
    :goto_1b
    :try_start_29
    const-string v5, "SystemServer"

    const-string v6, "Connectivity Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 514
    new-instance v76, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v76

    move-object/from16 v1, v31

    move-object/from16 v2, v30

    move-object/from16 v3, v26

    invoke-direct {v0, v13, v1, v2, v3}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_29
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_29} :catch_12

    .line 516
    .end local v75           #connectivity:Lcom/android/server/ConnectivityService;
    .local v76, connectivity:Lcom/android/server/ConnectivityService;
    :try_start_2a
    const-string v5, "connectivity"

    move-object/from16 v0, v76

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 517
    move-object/from16 v0, v30

    move-object/from16 v1, v76

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 518
    move-object/from16 v0, v26

    move-object/from16 v1, v76

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 519
    invoke-virtual/range {v146 .. v146}, Lcom/android/server/WifiService;->checkAndStartWifi()V

    .line 520
    invoke-virtual/range {v148 .. v148}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_2a
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_2a} :catch_44

    move-object/from16 v75, v76

    .line 526
    .end local v76           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v75       #connectivity:Lcom/android/server/ConnectivityService;
    :goto_1c
    :try_start_2b
    const-string v5, "SystemServer"

    const-string v6, "Network Service Discovery Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 527
    invoke-static {v13}, Lcom/android/server/NsdService;->create(Landroid/content/Context;)Lcom/android/server/NsdService;

    move-result-object v123

    .line 528
    const-string v5, "servicediscovery"

    move-object/from16 v0, v123

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2b
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2b} :catch_13

    .line 535
    :goto_1d
    :try_start_2c
    const-string v5, "SystemServer"

    const-string v6, "Throttle Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    new-instance v131, Lcom/android/server/ThrottleService;

    move-object/from16 v0, v131

    invoke-direct {v0, v13}, Lcom/android/server/ThrottleService;-><init>(Landroid/content/Context;)V
    :try_end_2c
    .catch Ljava/lang/Throwable; {:try_start_2c .. :try_end_2c} :catch_14

    .line 537
    .end local v130           #throttle:Lcom/android/server/ThrottleService;
    .local v131, throttle:Lcom/android/server/ThrottleService;
    :try_start_2d
    const-string v5, "throttle"

    move-object/from16 v0, v131

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2d
    .catch Ljava/lang/Throwable; {:try_start_2d .. :try_end_2d} :catch_43

    move-object/from16 v130, v131

    .line 544
    .end local v131           #throttle:Lcom/android/server/ThrottleService;
    .restart local v130       #throttle:Lcom/android/server/ThrottleService;
    :goto_1e
    :try_start_2e
    const-string v5, "SystemServer"

    const-string v6, "UpdateLock Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 545
    const-string v5, "updatelock"

    new-instance v6, Lcom/android/server/UpdateLockService;

    invoke-direct {v6, v13}, Lcom/android/server/UpdateLockService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2e
    .catch Ljava/lang/Throwable; {:try_start_2e .. :try_end_2e} :catch_15

    .line 556
    :goto_1f
    if-eqz v106, :cond_6

    .line 557
    invoke-virtual/range {v106 .. v106}, Lcom/android/server/MountService;->waitForAsecScan()V

    .line 561
    :cond_6
    if-eqz v61, :cond_7

    .line 562
    :try_start_2f
    invoke-virtual/range {v61 .. v61}, Landroid/accounts/AccountManagerService;->systemReady()V
    :try_end_2f
    .catch Ljava/lang/Throwable; {:try_start_2f .. :try_end_2f} :catch_16

    .line 568
    :cond_7
    :goto_20
    if-eqz v78, :cond_8

    .line 569
    :try_start_30
    invoke-virtual/range {v78 .. v78}, Landroid/content/ContentService;->systemReady()V
    :try_end_30
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_30} :catch_17

    .line 575
    :cond_8
    :goto_21
    :try_start_31
    const-string v5, "SystemServer"

    const-string v6, "Notification Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    new-instance v113, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v113

    move-object/from16 v1, v126

    invoke-direct {v0, v13, v1, v7}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_31
    .catch Ljava/lang/Throwable; {:try_start_31 .. :try_end_31} :catch_18

    .line 577
    .end local v112           #notification:Lcom/android/server/NotificationManagerService;
    .local v113, notification:Lcom/android/server/NotificationManagerService;
    :try_start_32
    const-string v5, "notification"

    move-object/from16 v0, v113

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 578
    move-object/from16 v0, v26

    move-object/from16 v1, v113

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_32
    .catch Ljava/lang/Throwable; {:try_start_32 .. :try_end_32} :catch_42

    move-object/from16 v112, v113

    .line 584
    .end local v113           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v112       #notification:Lcom/android/server/NotificationManagerService;
    :goto_22
    :try_start_33
    const-string v5, "SystemServer"

    const-string v6, "Device Storage Monitor"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    const-string v5, "devicestoragemonitor"

    new-instance v6, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v6, v13}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_33
    .catch Ljava/lang/Throwable; {:try_start_33 .. :try_end_33} :catch_19

    .line 592
    :goto_23
    :try_start_34
    const-string v5, "SystemServer"

    const-string v6, "Location Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    new-instance v102, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v102

    invoke-direct {v0, v13}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_34
    .catch Ljava/lang/Throwable; {:try_start_34 .. :try_end_34} :catch_1a

    .line 594
    .end local v101           #location:Lcom/android/server/LocationManagerService;
    .local v102, location:Lcom/android/server/LocationManagerService;
    :try_start_35
    const-string v5, "location"

    move-object/from16 v0, v102

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_35
    .catch Ljava/lang/Throwable; {:try_start_35 .. :try_end_35} :catch_41

    move-object/from16 v101, v102

    .line 600
    .end local v102           #location:Lcom/android/server/LocationManagerService;
    .restart local v101       #location:Lcom/android/server/LocationManagerService;
    :goto_24
    :try_start_36
    const-string v5, "SystemServer"

    const-string v6, "Country Detector"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 601
    new-instance v80, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v80

    invoke-direct {v0, v13}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_36
    .catch Ljava/lang/Throwable; {:try_start_36 .. :try_end_36} :catch_1b

    .line 602
    .end local v79           #countryDetector:Lcom/android/server/CountryDetectorService;
    .local v80, countryDetector:Lcom/android/server/CountryDetectorService;
    :try_start_37
    const-string v5, "country_detector"

    move-object/from16 v0, v80

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_37
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_37} :catch_40

    move-object/from16 v79, v80

    .line 608
    .end local v80           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v79       #countryDetector:Lcom/android/server/CountryDetectorService;
    :goto_25
    :try_start_38
    const-string v5, "SystemServer"

    const-string v6, "Search Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 609
    const-string v5, "search"

    new-instance v6, Landroid/server/search/SearchManagerService;

    invoke-direct {v6, v13}, Landroid/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_38
    .catch Ljava/lang/Throwable; {:try_start_38 .. :try_end_38} :catch_1c

    .line 616
    :goto_26
    :try_start_39
    const-string v5, "SystemServer"

    const-string v6, "DropBox Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    const-string v5, "dropbox"

    new-instance v6, Lcom/android/server/DropBoxManagerService;

    new-instance v8, Ljava/io/File;

    const-string v10, "/data/system/dropbox"

    invoke-direct {v8, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v13, v8}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_39
    .catch Ljava/lang/Throwable; {:try_start_39 .. :try_end_39} :catch_1d

    .line 623
    :goto_27
    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x111002b

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 626
    :try_start_3a
    const-string v5, "SystemServer"

    const-string v6, "Wallpaper Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    if-nez v34, :cond_9

    .line 628
    new-instance v145, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v145

    invoke-direct {v0, v13}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_3a
    .catch Ljava/lang/Throwable; {:try_start_3a .. :try_end_3a} :catch_1e

    .line 629
    .end local v144           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .local v145, wallpaper:Lcom/android/server/WallpaperManagerService;
    :try_start_3b
    const-string v5, "wallpaper"

    move-object/from16 v0, v145

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3b
    .catch Ljava/lang/Throwable; {:try_start_3b .. :try_end_3b} :catch_3f

    move-object/from16 v144, v145

    .line 636
    .end local v145           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v144       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_9
    :goto_28
    const-string v5, "0"

    const-string v6, "system_init.startaudioservice"

    invoke-static {v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a

    .line 638
    :try_start_3c
    const-string v5, "SystemServer"

    const-string v6, "Audio Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 639
    const-string v5, "audio"

    new-instance v6, Landroid/media/AudioService;

    invoke-direct {v6, v13}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3c
    .catch Ljava/lang/Throwable; {:try_start_3c .. :try_end_3c} :catch_1f

    .line 646
    :cond_a
    :goto_29
    :try_start_3d
    const-string v5, "SystemServer"

    const-string v6, "Dock Observer"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    new-instance v86, Lcom/android/server/DockObserver;

    move-object/from16 v0, v86

    invoke-direct {v0, v13}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;)V
    :try_end_3d
    .catch Ljava/lang/Throwable; {:try_start_3d .. :try_end_3d} :catch_20

    .end local v85           #dock:Lcom/android/server/DockObserver;
    .local v86, dock:Lcom/android/server/DockObserver;
    move-object/from16 v85, v86

    .line 654
    .end local v86           #dock:Lcom/android/server/DockObserver;
    .restart local v85       #dock:Lcom/android/server/DockObserver;
    :goto_2a
    :try_start_3e
    const-string v5, "SystemServer"

    const-string v6, "Wired Accessory Manager"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 656
    new-instance v5, Lcom/android/server/WiredAccessoryManager;

    move-object/from16 v0, v20

    invoke-direct {v5, v13, v0}, Lcom/android/server/WiredAccessoryManager;-><init>(Landroid/content/Context;Lcom/android/server/input/InputManagerService;)V

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Lcom/android/server/input/InputManagerService;->setWiredAccessoryCallbacks(Lcom/android/server/input/InputManagerService$WiredAccessoryCallbacks;)V
    :try_end_3e
    .catch Ljava/lang/Throwable; {:try_start_3e .. :try_end_3e} :catch_21

    .line 663
    :goto_2b
    :try_start_3f
    const-string v5, "SystemServer"

    const-string v6, "USB Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 665
    new-instance v140, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v140

    invoke-direct {v0, v13}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_3f
    .catch Ljava/lang/Throwable; {:try_start_3f .. :try_end_3f} :catch_22

    .line 666
    .end local v139           #usb:Lcom/android/server/usb/UsbService;
    .local v140, usb:Lcom/android/server/usb/UsbService;
    :try_start_40
    const-string v5, "usb"

    move-object/from16 v0, v140

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_40
    .catch Ljava/lang/Throwable; {:try_start_40 .. :try_end_40} :catch_3e

    move-object/from16 v139, v140

    .line 672
    .end local v140           #usb:Lcom/android/server/usb/UsbService;
    .restart local v139       #usb:Lcom/android/server/usb/UsbService;
    :goto_2c
    :try_start_41
    const-string v5, "SystemServer"

    const-string v6, "Serial Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 674
    new-instance v122, Lcom/android/server/SerialService;

    move-object/from16 v0, v122

    invoke-direct {v0, v13}, Lcom/android/server/SerialService;-><init>(Landroid/content/Context;)V
    :try_end_41
    .catch Ljava/lang/Throwable; {:try_start_41 .. :try_end_41} :catch_23

    .line 675
    .end local v121           #serial:Lcom/android/server/SerialService;
    .local v122, serial:Lcom/android/server/SerialService;
    :try_start_42
    const-string v5, "serial"

    move-object/from16 v0, v122

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_42
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_42} :catch_3d

    move-object/from16 v121, v122

    .line 681
    .end local v122           #serial:Lcom/android/server/SerialService;
    .restart local v121       #serial:Lcom/android/server/SerialService;
    :goto_2d
    :try_start_43
    const-string v5, "SystemServer"

    const-string v6, "Twilight Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    new-instance v135, Lcom/android/server/TwilightService;

    move-object/from16 v0, v135

    invoke-direct {v0, v13}, Lcom/android/server/TwilightService;-><init>(Landroid/content/Context;)V
    :try_end_43
    .catch Ljava/lang/Throwable; {:try_start_43 .. :try_end_43} :catch_24

    .end local v134           #twilight:Lcom/android/server/TwilightService;
    .local v135, twilight:Lcom/android/server/TwilightService;
    move-object/from16 v134, v135

    .line 688
    .end local v135           #twilight:Lcom/android/server/TwilightService;
    .restart local v134       #twilight:Lcom/android/server/TwilightService;
    :goto_2e
    :try_start_44
    const-string v5, "SystemServer"

    const-string v6, "UI Mode Manager Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 690
    new-instance v138, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v138

    move-object/from16 v1, v134

    invoke-direct {v0, v13, v1}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;Lcom/android/server/TwilightService;)V
    :try_end_44
    .catch Ljava/lang/Throwable; {:try_start_44 .. :try_end_44} :catch_25

    .end local v137           #uiMode:Lcom/android/server/UiModeManagerService;
    .local v138, uiMode:Lcom/android/server/UiModeManagerService;
    move-object/from16 v137, v138

    .line 696
    .end local v138           #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v137       #uiMode:Lcom/android/server/UiModeManagerService;
    :goto_2f
    :try_start_45
    const-string v5, "SystemServer"

    const-string v6, "Backup Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 697
    const-string v5, "backup"

    new-instance v6, Lcom/android/server/BackupManagerService;

    invoke-direct {v6, v13}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_45
    .catch Ljava/lang/Throwable; {:try_start_45 .. :try_end_45} :catch_26

    .line 704
    :goto_30
    :try_start_46
    const-string v5, "SystemServer"

    const-string v6, "AppWidget Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 705
    new-instance v65, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v65

    invoke-direct {v0, v13}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_46
    .catch Ljava/lang/Throwable; {:try_start_46 .. :try_end_46} :catch_27

    .line 706
    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .local v65, appWidget:Lcom/android/server/AppWidgetService;
    :try_start_47
    const-string v5, "appwidget"

    move-object/from16 v0, v65

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_47
    .catch Ljava/lang/Throwable; {:try_start_47 .. :try_end_47} :catch_3c

    move-object/from16 v64, v65

    .line 712
    .end local v65           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    :goto_31
    :try_start_48
    const-string v5, "SystemServer"

    const-string v6, "Recognition Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 713
    new-instance v120, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v120

    invoke-direct {v0, v13}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_48
    .catch Ljava/lang/Throwable; {:try_start_48 .. :try_end_48} :catch_28

    .end local v119           #recognition:Lcom/android/server/RecognitionManagerService;
    .local v120, recognition:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v119, v120

    .line 719
    .end local v120           #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v119       #recognition:Lcom/android/server/RecognitionManagerService;
    :goto_32
    :try_start_49
    const-string v5, "SystemServer"

    const-string v6, "DiskStats Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 720
    const-string v5, "diskstats"

    new-instance v6, Lcom/android/server/DiskStatsService;

    invoke-direct {v6, v13}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_49
    .catch Ljava/lang/Throwable; {:try_start_49 .. :try_end_49} :catch_29

    .line 730
    :goto_33
    :try_start_4a
    const-string v5, "SystemServer"

    const-string v6, "SamplingProfiler Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    const-string v5, "samplingprofiler"

    new-instance v6, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v6, v13}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v5, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4a
    .catch Ljava/lang/Throwable; {:try_start_4a .. :try_end_4a} :catch_2a

    .line 738
    :goto_34
    :try_start_4b
    const-string v5, "SystemServer"

    const-string v6, "NetworkTimeUpdateService"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 739
    new-instance v111, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v111

    invoke-direct {v0, v13}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_4b
    .catch Ljava/lang/Throwable; {:try_start_4b .. :try_end_4b} :catch_2b

    .end local v110           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .local v111, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v110, v111

    .line 745
    .end local v111           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v110       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    :goto_35
    :try_start_4c
    const-string v5, "SystemServer"

    const-string v6, "CommonTimeManagementService"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 746
    new-instance v73, Lcom/android/server/CommonTimeManagementService;

    move-object/from16 v0, v73

    invoke-direct {v0, v13}, Lcom/android/server/CommonTimeManagementService;-><init>(Landroid/content/Context;)V
    :try_end_4c
    .catch Ljava/lang/Throwable; {:try_start_4c .. :try_end_4c} :catch_2c

    .line 747
    .end local v72           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .local v73, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :try_start_4d
    const-string v5, "commontime_management"

    move-object/from16 v0, v73

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_4d .. :try_end_4d} :catch_3b

    move-object/from16 v72, v73

    .line 753
    .end local v73           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v72       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :goto_36
    :try_start_4e
    const-string v5, "SystemServer"

    const-string v6, "CertBlacklister"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    new-instance v5, Lcom/android/server/CertBlacklister;

    invoke-direct {v5, v13}, Lcom/android/server/CertBlacklister;-><init>(Landroid/content/Context;)V
    :try_end_4e
    .catch Ljava/lang/Throwable; {:try_start_4e .. :try_end_4e} :catch_2d

    .line 759
    :goto_37
    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x111003f

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 762
    :try_start_4f
    const-string v5, "SystemServer"

    const-string v6, "Dreams Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 764
    new-instance v88, Lcom/android/server/dreams/DreamManagerService;

    move-object/from16 v0, v88

    move-object/from16 v1, v22

    invoke-direct {v0, v13, v1}, Lcom/android/server/dreams/DreamManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V
    :try_end_4f
    .catch Ljava/lang/Throwable; {:try_start_4f .. :try_end_4f} :catch_2e

    .line 765
    .end local v87           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .local v88, dreamy:Lcom/android/server/dreams/DreamManagerService;
    :try_start_50
    const-string v5, "dreams"

    move-object/from16 v0, v88

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_50
    .catch Ljava/lang/Throwable; {:try_start_50 .. :try_end_50} :catch_3a

    move-object/from16 v87, v88

    .line 771
    .end local v88           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v87       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    :cond_b
    :goto_38
    const/16 v99, 0x1

    .line 772
    .local v99, isSysoffEnabled:Z
    const-string v70, "com.android.server.SysoffMonitor"

    .line 773
    .local v70, className:Ljava/lang/String;
    const/16 v71, 0x0

    .line 775
    .local v71, clazz:Ljava/lang/Class;
    :try_start_51
    invoke-static/range {v70 .. v70}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_51
    .catch Ljava/lang/ClassNotFoundException; {:try_start_51 .. :try_end_51} :catch_2f

    move-result-object v71

    .line 780
    :goto_39
    if-eqz v99, :cond_c

    .line 782
    :try_start_52
    const-string v5, "SystemServer"

    const-string v6, "Sysoff Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 783
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v8, Landroid/content/Context;

    aput-object v8, v5, v6

    const/4 v6, 0x1

    const-class v8, Lcom/android/server/ConnectivityService;

    aput-object v8, v5, v6

    move-object/from16 v0, v71

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v77

    .line 784
    .local v77, constructor:Ljava/lang/reflect/Constructor;
    const/4 v5, 0x2

    new-array v0, v5, [Ljava/lang/Object;

    move-object/from16 v66, v0

    .line 785
    .local v66, args:[Ljava/lang/Object;
    const/4 v5, 0x0

    aput-object v13, v66, v5

    .line 786
    const/4 v5, 0x1

    aput-object v75, v66, v5

    .line 787
    move-object/from16 v0, v77

    move-object/from16 v1, v66

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v114

    .line 788
    .local v114, object:Ljava/lang/Object;
    const-string v5, "sysoff"

    check-cast v114, Landroid/os/IBinder;

    .end local v114           #object:Ljava/lang/Object;
    move-object/from16 v0, v114

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_52
    .catch Ljava/lang/Throwable; {:try_start_52 .. :try_end_52} :catch_30

    .line 797
    .end local v66           #args:[Ljava/lang/Object;
    .end local v70           #className:Ljava/lang/String;
    .end local v71           #clazz:Ljava/lang/Class;
    .end local v77           #constructor:Ljava/lang/reflect/Constructor;
    .end local v99           #isSysoffEnabled:Z
    :cond_c
    :goto_3a
    invoke-virtual/range {v150 .. v150}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v48

    .line 798
    .local v48, safeMode:Z
    if-eqz v48, :cond_1b

    .line 799
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    .line 801
    const/4 v5, 0x1

    sput-boolean v5, Ldalvik/system/Zygote;->systemInSafeMode:Z

    .line 803
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v5

    invoke-virtual {v5}, Ldalvik/system/VMRuntime;->disableJitCompilation()V

    .line 812
    :goto_3b
    :try_start_53
    invoke-virtual/range {v141 .. v141}, Lcom/android/server/VibratorService;->systemReady()V
    :try_end_53
    .catch Ljava/lang/Throwable; {:try_start_53 .. :try_end_53} :catch_31

    .line 818
    :goto_3c
    :try_start_54
    invoke-virtual/range {v103 .. v103}, Lcom/android/internal/widget/LockSettingsService;->systemReady()V
    :try_end_54
    .catch Ljava/lang/Throwable; {:try_start_54 .. :try_end_54} :catch_32

    .line 823
    :goto_3d
    if-eqz v82, :cond_d

    .line 825
    :try_start_55
    invoke-virtual/range {v82 .. v82}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_55
    .catch Ljava/lang/Throwable; {:try_start_55 .. :try_end_55} :catch_33

    .line 831
    :cond_d
    :goto_3e
    if-eqz v112, :cond_e

    .line 833
    :try_start_56
    invoke-virtual/range {v112 .. v112}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_56
    .catch Ljava/lang/Throwable; {:try_start_56 .. :try_end_56} :catch_34

    .line 840
    :cond_e
    :goto_3f
    :try_start_57
    invoke-virtual/range {v150 .. v150}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_57
    .catch Ljava/lang/Throwable; {:try_start_57 .. :try_end_57} :catch_35

    .line 845
    :goto_40
    if-eqz v48, :cond_f

    .line 846
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    .line 852
    :cond_f
    invoke-virtual/range {v150 .. v150}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v74

    .line 853
    .local v74, config:Landroid/content/res/Configuration;
    new-instance v105, Landroid/util/DisplayMetrics;

    invoke-direct/range {v105 .. v105}, Landroid/util/DisplayMetrics;-><init>()V

    .line 854
    .local v105, metrics:Landroid/util/DisplayMetrics;
    const-string v5, "window"

    invoke-virtual {v13, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v143

    check-cast v143, Landroid/view/WindowManager;

    .line 855
    .local v143, w:Landroid/view/WindowManager;
    invoke-interface/range {v143 .. v143}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v5

    move-object/from16 v0, v105

    invoke-virtual {v5, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 856
    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    move-object/from16 v0, v74

    move-object/from16 v1, v105

    invoke-virtual {v5, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 859
    :try_start_58
    move-object/from16 v0, v134

    move-object/from16 v1, v87

    invoke-virtual {v15, v0, v1}, Lcom/android/server/power/PowerManagerService;->systemReady(Lcom/android/server/TwilightService;Lcom/android/server/dreams/DreamManagerService;)V
    :try_end_58
    .catch Ljava/lang/Throwable; {:try_start_58 .. :try_end_58} :catch_36

    .line 865
    :goto_41
    :try_start_59
    invoke-interface/range {v115 .. v115}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_59
    .catch Ljava/lang/Throwable; {:try_start_59 .. :try_end_59} :catch_37

    .line 871
    :goto_42
    :try_start_5a
    move/from16 v0, v48

    move/from16 v1, v25

    invoke-virtual {v11, v0, v1}, Lcom/android/server/display/DisplayManagerService;->systemReady(ZZ)V
    :try_end_5a
    .catch Ljava/lang/Throwable; {:try_start_5a .. :try_end_5a} :catch_38

    .line 877
    :goto_43
    move-object/from16 v35, v13

    .line 878
    .local v35, contextF:Landroid/content/Context;
    move-object/from16 v36, v106

    .line 879
    .local v36, mountServiceF:Lcom/android/server/MountService;
    move-object/from16 v37, v9

    .line 880
    .local v37, batteryF:Lcom/android/server/BatteryService;
    move-object/from16 v38, v31

    .line 881
    .local v38, networkManagementF:Lcom/android/server/NetworkManagementService;
    move-object/from16 v39, v30

    .line 882
    .local v39, networkStatsF:Lcom/android/server/net/NetworkStatsService;
    move-object/from16 v40, v26

    .line 883
    .local v40, networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v41, v75

    .line 884
    .local v41, connectivityF:Lcom/android/server/ConnectivityService;
    move-object/from16 v42, v85

    .line 885
    .local v42, dockF:Lcom/android/server/DockObserver;
    move-object/from16 v43, v139

    .line 886
    .local v43, usbF:Lcom/android/server/usb/UsbService;
    move-object/from16 v54, v130

    .line 887
    .local v54, throttleF:Lcom/android/server/ThrottleService;
    move-object/from16 v44, v134

    .line 888
    .local v44, twilightF:Lcom/android/server/TwilightService;
    move-object/from16 v45, v137

    .line 889
    .local v45, uiModeF:Lcom/android/server/UiModeManagerService;
    move-object/from16 v47, v64

    .line 890
    .local v47, appWidgetF:Lcom/android/server/AppWidgetService;
    move-object/from16 v49, v144

    .line 891
    .local v49, wallpaperF:Lcom/android/server/WallpaperManagerService;
    move-object/from16 v50, v94

    .line 892
    .local v50, immF:Lcom/android/server/InputMethodManagerService;
    move-object/from16 v46, v119

    .line 893
    .local v46, recognitionF:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v52, v101

    .line 894
    .local v52, locationF:Lcom/android/server/LocationManagerService;
    move-object/from16 v53, v79

    .line 895
    .local v53, countryDetectorF:Lcom/android/server/CountryDetectorService;
    move-object/from16 v55, v110

    .line 896
    .local v55, networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v56, v72

    .line 897
    .local v56, commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    move-object/from16 v57, v132

    .line 898
    .local v57, textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    move-object/from16 v51, v126

    .line 899
    .local v51, statusBarF:Lcom/android/server/StatusBarManagerService;
    move-object/from16 v58, v87

    .line 900
    .local v58, dreamyF:Lcom/android/server/dreams/DreamManagerService;
    move-object/from16 v59, v20

    .line 901
    .local v59, inputManagerF:Lcom/android/server/input/InputManagerService;
    move-object/from16 v60, v128

    .line 908
    .local v60, telephonyRegistryF:Lcom/android/server/TelephonyRegistry;
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v5

    new-instance v32, Lcom/android/server/ServerThread$3;

    move-object/from16 v33, p0

    invoke-direct/range {v32 .. v60}, Lcom/android/server/ServerThread$3;-><init>(Lcom/android/server/ServerThread;ZLandroid/content/Context;Lcom/android/server/MountService;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/TwilightService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/CommonTimeManagementService;Lcom/android/server/TextServicesManagerService;Lcom/android/server/dreams/DreamManagerService;Lcom/android/server/input/InputManagerService;Lcom/android/server/TelephonyRegistry;)V

    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 1038
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v5

    if-eqz v5, :cond_10

    .line 1039
    const-string v5, "SystemServer"

    const-string v6, "Enabled StrictMode for system server main thread."

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1042
    :cond_10
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 1043
    const-string v5, "SystemServer"

    const-string v6, "System ServerThread is exiting!"

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1044
    return-void

    .line 109
    .end local v7           #lights:Lcom/android/server/LightsService;
    .end local v9           #battery:Lcom/android/server/BatteryService;
    .end local v11           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v13           #context:Landroid/content/Context;
    .end local v15           #power:Lcom/android/server/power/PowerManagerService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v21           #uiHandler:Landroid/os/Handler;
    .end local v22           #wmHandler:Landroid/os/Handler;
    .end local v25           #onlyCore:Z
    .end local v26           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v30           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .end local v31           #networkManagement:Lcom/android/server/NetworkManagementService;
    .end local v34           #headless:Z
    .end local v35           #contextF:Landroid/content/Context;
    .end local v36           #mountServiceF:Lcom/android/server/MountService;
    .end local v37           #batteryF:Lcom/android/server/BatteryService;
    .end local v38           #networkManagementF:Lcom/android/server/NetworkManagementService;
    .end local v39           #networkStatsF:Lcom/android/server/net/NetworkStatsService;
    .end local v40           #networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v41           #connectivityF:Lcom/android/server/ConnectivityService;
    .end local v42           #dockF:Lcom/android/server/DockObserver;
    .end local v43           #usbF:Lcom/android/server/usb/UsbService;
    .end local v44           #twilightF:Lcom/android/server/TwilightService;
    .end local v45           #uiModeF:Lcom/android/server/UiModeManagerService;
    .end local v46           #recognitionF:Lcom/android/server/RecognitionManagerService;
    .end local v47           #appWidgetF:Lcom/android/server/AppWidgetService;
    .end local v48           #safeMode:Z
    .end local v49           #wallpaperF:Lcom/android/server/WallpaperManagerService;
    .end local v50           #immF:Lcom/android/server/InputMethodManagerService;
    .end local v51           #statusBarF:Lcom/android/server/StatusBarManagerService;
    .end local v52           #locationF:Lcom/android/server/LocationManagerService;
    .end local v53           #countryDetectorF:Lcom/android/server/CountryDetectorService;
    .end local v54           #throttleF:Lcom/android/server/ThrottleService;
    .end local v55           #networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    .end local v56           #commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    .end local v57           #textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    .end local v58           #dreamyF:Lcom/android/server/dreams/DreamManagerService;
    .end local v59           #inputManagerF:Lcom/android/server/input/InputManagerService;
    .end local v60           #telephonyRegistryF:Lcom/android/server/TelephonyRegistry;
    .end local v61           #accountManager:Landroid/accounts/AccountManagerService;
    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v68           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .end local v72           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .end local v74           #config:Landroid/content/res/Configuration;
    .end local v75           #connectivity:Lcom/android/server/ConnectivityService;
    .end local v78           #contentService:Landroid/content/ContentService;
    .end local v79           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v82           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v85           #dock:Lcom/android/server/DockObserver;
    .end local v87           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .end local v91           #factoryTest:I
    .end local v92           #factoryTestStr:Ljava/lang/String;
    .end local v94           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v101           #location:Lcom/android/server/LocationManagerService;
    .end local v103           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v105           #metrics:Landroid/util/DisplayMetrics;
    .end local v106           #mountService:Lcom/android/server/MountService;
    .end local v110           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .end local v112           #notification:Lcom/android/server/NotificationManagerService;
    .end local v115           #pm:Landroid/content/pm/IPackageManager;
    .end local v119           #recognition:Lcom/android/server/RecognitionManagerService;
    .end local v121           #serial:Lcom/android/server/SerialService;
    .end local v123           #serviceDiscovery:Lcom/android/server/NsdService;
    .end local v126           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v130           #throttle:Lcom/android/server/ThrottleService;
    .end local v132           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v134           #twilight:Lcom/android/server/TwilightService;
    .end local v136           #uiHandlerThread:Landroid/os/HandlerThread;
    .end local v137           #uiMode:Lcom/android/server/UiModeManagerService;
    .end local v139           #usb:Lcom/android/server/usb/UsbService;
    .end local v141           #vibrator:Lcom/android/server/VibratorService;
    .end local v143           #w:Landroid/view/WindowManager;
    .end local v144           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .end local v146           #wifi:Lcom/android/server/WifiService;
    .end local v148           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .end local v150           #wm:Lcom/android/server/wm/WindowManagerService;
    .end local v151           #wmHandlerThread:Landroid/os/HandlerThread;
    :cond_11
    const/16 v118, 0x0

    goto/16 :goto_0

    .line 115
    .restart local v118       #reboot:Z
    :cond_12
    const/16 v117, 0x0

    .restart local v117       #reason:Ljava/lang/String;
    goto/16 :goto_1

    .line 123
    .end local v117           #reason:Ljava/lang/String;
    .end local v118           #reboot:Z
    .restart local v92       #factoryTestStr:Ljava/lang/String;
    :cond_13
    invoke-static/range {v92 .. v92}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v91

    goto/16 :goto_2

    .line 249
    .restart local v11       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v13       #context:Landroid/content/Context;
    .restart local v15       #power:Lcom/android/server/power/PowerManagerService;
    .restart local v21       #uiHandler:Landroid/os/Handler;
    .restart local v22       #wmHandler:Landroid/os/Handler;
    .restart local v25       #onlyCore:Z
    .restart local v30       #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v31       #networkManagement:Lcom/android/server/NetworkManagementService;
    .restart local v34       #headless:Z
    .restart local v61       #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v68       #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v72       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v75       #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v78       #contentService:Landroid/content/ContentService;
    .restart local v81       #cryptState:Ljava/lang/String;
    .restart local v85       #dock:Lcom/android/server/DockObserver;
    .restart local v91       #factoryTest:I
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v100       #lights:Lcom/android/server/LightsService;
    .restart local v106       #mountService:Lcom/android/server/MountService;
    .restart local v108       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v110       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v115       #pm:Landroid/content/pm/IPackageManager;
    .restart local v119       #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v121       #serial:Lcom/android/server/SerialService;
    .restart local v123       #serviceDiscovery:Lcom/android/server/NsdService;
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v130       #throttle:Lcom/android/server/ThrottleService;
    .restart local v134       #twilight:Lcom/android/server/TwilightService;
    .restart local v136       #uiHandlerThread:Landroid/os/HandlerThread;
    .restart local v137       #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v139       #usb:Lcom/android/server/usb/UsbService;
    .restart local v141       #vibrator:Lcom/android/server/VibratorService;
    .restart local v146       #wifi:Lcom/android/server/WifiService;
    .restart local v148       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v150       #wm:Lcom/android/server/wm/WindowManagerService;
    .restart local v151       #wmHandlerThread:Landroid/os/HandlerThread;
    :cond_14
    :try_start_5b
    const-string v5, "1"

    move-object/from16 v0, v81

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 250
    const-string v5, "SystemServer"

    const-string v6, "Device encrypted - only parsing core apps"

    invoke-static {v5, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    const/16 v25, 0x1

    goto/16 :goto_3

    .line 254
    :cond_15
    const/4 v5, 0x0

    goto/16 :goto_4

    .line 292
    .restart local v93       #firstBoot:Z
    .restart local v124       #setRTC:Z
    :catch_0
    move-exception v89

    .line 293
    .local v89, e:Ljava/lang/Throwable;
    :goto_44
    const-string v5, "SystemServer"

    const-string v6, "Failure starting Account Manager"

    move-object/from16 v0, v89

    invoke-static {v5, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5b
    .catch Ljava/lang/RuntimeException; {:try_start_5b .. :try_end_5b} :catch_1

    goto/16 :goto_6

    .line 359
    .end local v81           #cryptState:Ljava/lang/String;
    .end local v89           #e:Ljava/lang/Throwable;
    .end local v93           #firstBoot:Z
    .end local v124           #setRTC:Z
    :catch_1
    move-exception v89

    move-object/from16 v128, v129

    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v96

    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v9, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v9       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v7, v100

    .end local v100           #lights:Lcom/android/server/LightsService;
    .restart local v7       #lights:Lcom/android/server/LightsService;
    move-object/from16 v97, v98

    .line 360
    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .local v89, e:Ljava/lang/RuntimeException;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    :goto_45
    const-string v5, "System"

    const-string v6, "******************************************"

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    const-string v5, "System"

    const-string v6, "************ Failure starting core service"

    move-object/from16 v0, v89

    invoke-static {v5, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_b

    .line 297
    .end local v7           #lights:Lcom/android/server/LightsService;
    .end local v9           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v89           #e:Ljava/lang/RuntimeException;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v81       #cryptState:Ljava/lang/String;
    .restart local v93       #firstBoot:Z
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v100       #lights:Lcom/android/server/LightsService;
    .restart local v124       #setRTC:Z
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :cond_16
    const/4 v5, 0x0

    goto/16 :goto_7

    .line 331
    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v67           #battery:Lcom/android/server/BatteryService;
    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v100           #lights:Lcom/android/server/LightsService;
    .end local v141           #vibrator:Lcom/android/server/VibratorService;
    .restart local v7       #lights:Lcom/android/server/LightsService;
    .restart local v9       #battery:Lcom/android/server/BatteryService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v142       #vibrator:Lcom/android/server/VibratorService;
    :cond_17
    const/16 v23, 0x0

    goto/16 :goto_8

    :cond_18
    const/16 v24, 0x0

    goto/16 :goto_9

    .line 351
    :cond_19
    const/4 v5, 0x1

    move/from16 v0, v91

    if-ne v0, v5, :cond_1a

    .line 352
    :try_start_5c
    const-string v5, "SystemServer"

    const-string v6, "No Bluetooth Service (factory test)"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a

    .line 359
    :catch_2
    move-exception v89

    move-object/from16 v128, v129

    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v141, v142

    .end local v142           #vibrator:Lcom/android/server/VibratorService;
    .restart local v141       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v97, v98

    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    goto :goto_45

    .line 354
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v141           #vibrator:Lcom/android/server/VibratorService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v142       #vibrator:Lcom/android/server/VibratorService;
    :cond_1a
    const-string v5, "SystemServer"

    const-string v6, "Bluetooth Manager Service"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    new-instance v69, Lcom/android/server/BluetoothManagerService;

    move-object/from16 v0, v69

    invoke-direct {v0, v13}, Lcom/android/server/BluetoothManagerService;-><init>(Landroid/content/Context;)V
    :try_end_5c
    .catch Ljava/lang/RuntimeException; {:try_start_5c .. :try_end_5c} :catch_2

    .line 356
    .end local v68           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .local v69, bluetooth:Lcom/android/server/BluetoothManagerService;
    :try_start_5d
    const-string v5, "bluetooth_manager"

    move-object/from16 v0, v69

    invoke-static {v5, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5d
    .catch Ljava/lang/RuntimeException; {:try_start_5d .. :try_end_5d} :catch_59

    move-object/from16 v68, v69

    .end local v69           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v68       #bluetooth:Lcom/android/server/BluetoothManagerService;
    goto/16 :goto_a

    .line 382
    .end local v81           #cryptState:Ljava/lang/String;
    .end local v93           #firstBoot:Z
    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .end local v124           #setRTC:Z
    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v142           #vibrator:Lcom/android/server/VibratorService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v79       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v82       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v87       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v94       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    .restart local v101       #location:Lcom/android/server/LocationManagerService;
    .restart local v103       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v112       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v126       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v132       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v141       #vibrator:Lcom/android/server/VibratorService;
    .restart local v144       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_3
    move-exception v89

    .line 383
    .local v89, e:Ljava/lang/Throwable;
    :goto_46
    const-string v5, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .line 390
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_4
    move-exception v89

    .line 391
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_d

    .line 397
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_5
    move-exception v89

    .line 398
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_e

    .line 403
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_6
    move-exception v89

    .line 404
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_f

    .line 425
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_7
    move-exception v89

    .line 426
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_47
    const-string v5, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_11

    .line 434
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_8
    move-exception v89

    .line 435
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_48
    const-string v5, "starting LockSettingsService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_12

    .line 442
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_9
    move-exception v89

    .line 443
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_49
    const-string v5, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_13

    .line 450
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_a
    move-exception v89

    .line 451
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_4a
    const-string v5, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_14

    .line 458
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_b
    move-exception v89

    .line 459
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_15

    .line 466
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_c
    move-exception v89

    .line 467
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_16

    .line 474
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_d
    move-exception v89

    .line 475
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_4b
    const-string v5, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_17

    .line 482
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_e
    move-exception v89

    .line 483
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_4c
    const-string v5, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_18

    .line 492
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_f
    move-exception v89

    move-object/from16 v26, v108

    .line 493
    .end local v108           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v26       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_4d
    const-string v5, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_19

    .line 500
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_10
    move-exception v89

    .line 501
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_4e
    const-string v5, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1a

    .line 508
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_11
    move-exception v89

    .line 509
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_4f
    const-string v5, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1b

    .line 521
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_12
    move-exception v89

    .line 522
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_50
    const-string v5, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1c

    .line 530
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_13
    move-exception v89

    .line 531
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting Service Discovery Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1d

    .line 539
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_14
    move-exception v89

    .line 540
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_51
    const-string v5, "starting ThrottleService"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1e

    .line 547
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_15
    move-exception v89

    .line 548
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting UpdateLockService"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1f

    .line 563
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_16
    move-exception v89

    .line 564
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making Account Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_20

    .line 570
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_17
    move-exception v89

    .line 571
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making Content Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_21

    .line 579
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_18
    move-exception v89

    .line 580
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_52
    const-string v5, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_22

    .line 587
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_19
    move-exception v89

    .line 588
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_23

    .line 595
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_1a
    move-exception v89

    .line 596
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_53
    const-string v5, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_24

    .line 603
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_1b
    move-exception v89

    .line 604
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_54
    const-string v5, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_25

    .line 611
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_1c
    move-exception v89

    .line 612
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_26

    .line 619
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_1d
    move-exception v89

    .line 620
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_27

    .line 631
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_1e
    move-exception v89

    .line 632
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_55
    const-string v5, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_28

    .line 640
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_1f
    move-exception v89

    .line 641
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_29

    .line 649
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_20
    move-exception v89

    .line 650
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a

    .line 658
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_21
    move-exception v89

    .line 659
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting WiredAccessoryManager"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2b

    .line 667
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_22
    move-exception v89

    .line 668
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_56
    const-string v5, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2c

    .line 676
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_23
    move-exception v89

    .line 677
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_57
    const-string v5, "SystemServer"

    const-string v6, "Failure starting SerialService"

    move-object/from16 v0, v89

    invoke-static {v5, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2d

    .line 683
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_24
    move-exception v89

    .line 684
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting TwilightService"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2e

    .line 691
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_25
    move-exception v89

    .line 692
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2f

    .line 699
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_26
    move-exception v89

    .line 700
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v6, "Failure starting Backup Service"

    move-object/from16 v0, v89

    invoke-static {v5, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_30

    .line 707
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_27
    move-exception v89

    .line 708
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_58
    const-string v5, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_31

    .line 714
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_28
    move-exception v89

    .line 715
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_32

    .line 721
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_29
    move-exception v89

    .line 722
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_33

    .line 733
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_2a
    move-exception v89

    .line 734
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_34

    .line 740
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_2b
    move-exception v89

    .line 741
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_35

    .line 748
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_2c
    move-exception v89

    .line 749
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_59
    const-string v5, "starting CommonTimeManagementService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_36

    .line 755
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_2d
    move-exception v89

    .line 756
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "starting CertBlacklister"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_37

    .line 766
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_2e
    move-exception v89

    .line 767
    .restart local v89       #e:Ljava/lang/Throwable;
    :goto_5a
    const-string v5, "starting DreamManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_38

    .line 776
    .end local v89           #e:Ljava/lang/Throwable;
    .restart local v70       #className:Ljava/lang/String;
    .restart local v71       #clazz:Ljava/lang/Class;
    .restart local v99       #isSysoffEnabled:Z
    :catch_2f
    move-exception v90

    .line 777
    .local v90, ex:Ljava/lang/ClassNotFoundException;
    const/16 v99, 0x0

    goto/16 :goto_39

    .line 789
    .end local v90           #ex:Ljava/lang/ClassNotFoundException;
    :catch_30
    move-exception v89

    .line 790
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "SystemServer"

    const-string v6, "Failure starting Hotoff Service"

    move-object/from16 v0, v89

    invoke-static {v5, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3a

    .line 806
    .end local v70           #className:Ljava/lang/String;
    .end local v71           #clazz:Ljava/lang/Class;
    .end local v89           #e:Ljava/lang/Throwable;
    .end local v99           #isSysoffEnabled:Z
    .restart local v48       #safeMode:Z
    :cond_1b
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v5

    invoke-virtual {v5}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_3b

    .line 813
    :catch_31
    move-exception v89

    .line 814
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making Vibrator Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3c

    .line 819
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_32
    move-exception v89

    .line 820
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making Lock Settings Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3d

    .line 826
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_33
    move-exception v89

    .line 827
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3e

    .line 834
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_34
    move-exception v89

    .line 835
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3f

    .line 841
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_35
    move-exception v89

    .line 842
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_40

    .line 860
    .end local v89           #e:Ljava/lang/Throwable;
    .restart local v74       #config:Landroid/content/res/Configuration;
    .restart local v105       #metrics:Landroid/util/DisplayMetrics;
    .restart local v143       #w:Landroid/view/WindowManager;
    :catch_36
    move-exception v89

    .line 861
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making Power Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_41

    .line 866
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_37
    move-exception v89

    .line 867
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_42

    .line 872
    .end local v89           #e:Ljava/lang/Throwable;
    :catch_38
    move-exception v89

    .line 873
    .restart local v89       #e:Ljava/lang/Throwable;
    const-string v5, "making Display Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v89

    invoke-virtual {v0, v5, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_43

    .line 260
    .end local v7           #lights:Lcom/android/server/LightsService;
    .end local v9           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v26           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v48           #safeMode:Z
    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v74           #config:Landroid/content/res/Configuration;
    .end local v79           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v82           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v87           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .end local v89           #e:Ljava/lang/Throwable;
    .end local v94           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v101           #location:Lcom/android/server/LocationManagerService;
    .end local v103           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v105           #metrics:Landroid/util/DisplayMetrics;
    .end local v112           #notification:Lcom/android/server/NotificationManagerService;
    .end local v126           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v132           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v143           #w:Landroid/view/WindowManager;
    .end local v144           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v81       #cryptState:Ljava/lang/String;
    .restart local v93       #firstBoot:Z
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v100       #lights:Lcom/android/server/LightsService;
    .restart local v108       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_39
    move-exception v5

    goto/16 :goto_5

    .line 766
    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v67           #battery:Lcom/android/server/BatteryService;
    .end local v81           #cryptState:Ljava/lang/String;
    .end local v93           #firstBoot:Z
    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .end local v100           #lights:Lcom/android/server/LightsService;
    .end local v108           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v7       #lights:Lcom/android/server/LightsService;
    .restart local v9       #battery:Lcom/android/server/BatteryService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v26       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v79       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v82       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v88       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v94       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    .restart local v101       #location:Lcom/android/server/LocationManagerService;
    .restart local v103       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v112       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v126       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v132       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v144       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_3a
    move-exception v89

    move-object/from16 v87, v88

    .end local v88           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v87       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    goto/16 :goto_5a

    .line 748
    .end local v72           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v73       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :catch_3b
    move-exception v89

    move-object/from16 v72, v73

    .end local v73           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v72       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    goto/16 :goto_59

    .line 707
    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v65       #appWidget:Lcom/android/server/AppWidgetService;
    :catch_3c
    move-exception v89

    move-object/from16 v64, v65

    .end local v65           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_58

    .line 676
    .end local v121           #serial:Lcom/android/server/SerialService;
    .restart local v122       #serial:Lcom/android/server/SerialService;
    :catch_3d
    move-exception v89

    move-object/from16 v121, v122

    .end local v122           #serial:Lcom/android/server/SerialService;
    .restart local v121       #serial:Lcom/android/server/SerialService;
    goto/16 :goto_57

    .line 667
    .end local v139           #usb:Lcom/android/server/usb/UsbService;
    .restart local v140       #usb:Lcom/android/server/usb/UsbService;
    :catch_3e
    move-exception v89

    move-object/from16 v139, v140

    .end local v140           #usb:Lcom/android/server/usb/UsbService;
    .restart local v139       #usb:Lcom/android/server/usb/UsbService;
    goto/16 :goto_56

    .line 631
    .end local v144           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v145       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_3f
    move-exception v89

    move-object/from16 v144, v145

    .end local v145           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v144       #wallpaper:Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_55

    .line 603
    .end local v79           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v80       #countryDetector:Lcom/android/server/CountryDetectorService;
    :catch_40
    move-exception v89

    move-object/from16 v79, v80

    .end local v80           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v79       #countryDetector:Lcom/android/server/CountryDetectorService;
    goto/16 :goto_54

    .line 595
    .end local v101           #location:Lcom/android/server/LocationManagerService;
    .restart local v102       #location:Lcom/android/server/LocationManagerService;
    :catch_41
    move-exception v89

    move-object/from16 v101, v102

    .end local v102           #location:Lcom/android/server/LocationManagerService;
    .restart local v101       #location:Lcom/android/server/LocationManagerService;
    goto/16 :goto_53

    .line 579
    .end local v112           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v113       #notification:Lcom/android/server/NotificationManagerService;
    :catch_42
    move-exception v89

    move-object/from16 v112, v113

    .end local v113           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v112       #notification:Lcom/android/server/NotificationManagerService;
    goto/16 :goto_52

    .line 539
    .end local v130           #throttle:Lcom/android/server/ThrottleService;
    .restart local v131       #throttle:Lcom/android/server/ThrottleService;
    :catch_43
    move-exception v89

    move-object/from16 v130, v131

    .end local v131           #throttle:Lcom/android/server/ThrottleService;
    .restart local v130       #throttle:Lcom/android/server/ThrottleService;
    goto/16 :goto_51

    .line 521
    .end local v75           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v76       #connectivity:Lcom/android/server/ConnectivityService;
    :catch_44
    move-exception v89

    move-object/from16 v75, v76

    .end local v76           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v75       #connectivity:Lcom/android/server/ConnectivityService;
    goto/16 :goto_50

    .line 508
    .end local v146           #wifi:Lcom/android/server/WifiService;
    .restart local v147       #wifi:Lcom/android/server/WifiService;
    :catch_45
    move-exception v89

    move-object/from16 v146, v147

    .end local v147           #wifi:Lcom/android/server/WifiService;
    .restart local v146       #wifi:Lcom/android/server/WifiService;
    goto/16 :goto_4f

    .line 500
    .end local v148           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v149       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :catch_46
    move-exception v89

    move-object/from16 v148, v149

    .end local v149           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v148       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    goto/16 :goto_4e

    .line 492
    :catch_47
    move-exception v89

    goto/16 :goto_4d

    .line 482
    .end local v26           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v30           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v108       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v109       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :catch_48
    move-exception v89

    move-object/from16 v30, v109

    .end local v109           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v30       #networkStats:Lcom/android/server/net/NetworkStatsService;
    goto/16 :goto_4c

    .line 474
    .end local v132           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v133       #tsms:Lcom/android/server/TextServicesManagerService;
    :catch_49
    move-exception v89

    move-object/from16 v132, v133

    .end local v133           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v132       #tsms:Lcom/android/server/TextServicesManagerService;
    goto/16 :goto_4b

    .line 450
    .end local v126           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v127       #statusBar:Lcom/android/server/StatusBarManagerService;
    :catch_4a
    move-exception v89

    move-object/from16 v126, v127

    .end local v127           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v126       #statusBar:Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_4a

    .line 442
    .end local v82           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v83       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :catch_4b
    move-exception v89

    move-object/from16 v82, v83

    .end local v83           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v82       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_49

    .line 434
    .end local v103           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v104       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :catch_4c
    move-exception v89

    move-object/from16 v103, v104

    .end local v104           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v103       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    goto/16 :goto_48

    .line 425
    .end local v106           #mountService:Lcom/android/server/MountService;
    .restart local v107       #mountService:Lcom/android/server/MountService;
    :catch_4d
    move-exception v89

    move-object/from16 v106, v107

    .end local v107           #mountService:Lcom/android/server/MountService;
    .restart local v106       #mountService:Lcom/android/server/MountService;
    goto/16 :goto_47

    .line 412
    :catch_4e
    move-exception v5

    goto/16 :goto_10

    .line 382
    .end local v94           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v95       #imm:Lcom/android/server/InputMethodManagerService;
    :catch_4f
    move-exception v89

    move-object/from16 v94, v95

    .end local v95           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v94       #imm:Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_46

    .line 359
    .end local v7           #lights:Lcom/android/server/LightsService;
    .end local v9           #battery:Lcom/android/server/BatteryService;
    .end local v11           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v15           #power:Lcom/android/server/power/PowerManagerService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v64           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v79           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v82           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v87           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .end local v94           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v101           #location:Lcom/android/server/LocationManagerService;
    .end local v103           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v112           #notification:Lcom/android/server/NotificationManagerService;
    .end local v126           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v132           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v144           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v84       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v100       #lights:Lcom/android/server/LightsService;
    .restart local v116       #power:Lcom/android/server/power/PowerManagerService;
    :catch_50
    move-exception v89

    move-object/from16 v20, v96

    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v9, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v9       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v11, v84

    .end local v84           #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v11       #display:Lcom/android/server/display/DisplayManagerService;
    move-object/from16 v15, v116

    .end local v116           #power:Lcom/android/server/power/PowerManagerService;
    .restart local v15       #power:Lcom/android/server/power/PowerManagerService;
    move-object/from16 v7, v100

    .end local v100           #lights:Lcom/android/server/LightsService;
    .restart local v7       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_45

    .end local v7           #lights:Lcom/android/server/LightsService;
    .end local v9           #battery:Lcom/android/server/BatteryService;
    .end local v11           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v15           #power:Lcom/android/server/power/PowerManagerService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v84       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v100       #lights:Lcom/android/server/LightsService;
    .restart local v116       #power:Lcom/android/server/power/PowerManagerService;
    :catch_51
    move-exception v89

    move-object/from16 v20, v96

    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v9, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v9       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v11, v84

    .end local v84           #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v11       #display:Lcom/android/server/display/DisplayManagerService;
    move-object/from16 v15, v116

    .end local v116           #power:Lcom/android/server/power/PowerManagerService;
    .restart local v15       #power:Lcom/android/server/power/PowerManagerService;
    move-object/from16 v7, v100

    .end local v100           #lights:Lcom/android/server/LightsService;
    .restart local v7       #lights:Lcom/android/server/LightsService;
    move-object/from16 v97, v98

    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_45

    .end local v7           #lights:Lcom/android/server/LightsService;
    .end local v9           #battery:Lcom/android/server/BatteryService;
    .end local v11           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v84       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v100       #lights:Lcom/android/server/LightsService;
    :catch_52
    move-exception v89

    move-object/from16 v20, v96

    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v9, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v9       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v11, v84

    .end local v84           #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v11       #display:Lcom/android/server/display/DisplayManagerService;
    move-object/from16 v7, v100

    .end local v100           #lights:Lcom/android/server/LightsService;
    .restart local v7       #lights:Lcom/android/server/LightsService;
    move-object/from16 v97, v98

    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_45

    .end local v7           #lights:Lcom/android/server/LightsService;
    .end local v9           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v100       #lights:Lcom/android/server/LightsService;
    :catch_53
    move-exception v89

    move-object/from16 v20, v96

    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v9, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v9       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v7, v100

    .end local v100           #lights:Lcom/android/server/LightsService;
    .restart local v7       #lights:Lcom/android/server/LightsService;
    move-object/from16 v97, v98

    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_45

    .end local v7           #lights:Lcom/android/server/LightsService;
    .end local v9           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v61           #accountManager:Landroid/accounts/AccountManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v62       #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v81       #cryptState:Ljava/lang/String;
    .restart local v93       #firstBoot:Z
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v100       #lights:Lcom/android/server/LightsService;
    .restart local v124       #setRTC:Z
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_54
    move-exception v89

    move-object/from16 v128, v129

    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v96

    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v9, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v9       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v7, v100

    .end local v100           #lights:Lcom/android/server/LightsService;
    .restart local v7       #lights:Lcom/android/server/LightsService;
    move-object/from16 v61, v62

    .end local v62           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v61       #accountManager:Landroid/accounts/AccountManagerService;
    move-object/from16 v97, v98

    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_45

    .end local v9           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_55
    move-exception v89

    move-object/from16 v128, v129

    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v96

    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v9, v67

    .end local v67           #battery:Lcom/android/server/BatteryService;
    .restart local v9       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v97, v98

    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_45

    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_56
    move-exception v89

    move-object/from16 v128, v129

    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v96

    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v97, v98

    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_45

    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v141           #vibrator:Lcom/android/server/VibratorService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v142       #vibrator:Lcom/android/server/VibratorService;
    :catch_57
    move-exception v89

    move-object/from16 v128, v129

    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v96

    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v63

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v141, v142

    .end local v142           #vibrator:Lcom/android/server/VibratorService;
    .restart local v141       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v97, v98

    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_45

    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v141           #vibrator:Lcom/android/server/VibratorService;
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v142       #vibrator:Lcom/android/server/VibratorService;
    :catch_58
    move-exception v89

    move-object/from16 v128, v129

    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v96

    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v141, v142

    .end local v142           #vibrator:Lcom/android/server/VibratorService;
    .restart local v141       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v97, v98

    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_45

    .end local v68           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v141           #vibrator:Lcom/android/server/VibratorService;
    .restart local v69       #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v142       #vibrator:Lcom/android/server/VibratorService;
    :catch_59
    move-exception v89

    move-object/from16 v128, v129

    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v68, v69

    .end local v69           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v68       #bluetooth:Lcom/android/server/BluetoothManagerService;
    move-object/from16 v141, v142

    .end local v142           #vibrator:Lcom/android/server/VibratorService;
    .restart local v141       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v97, v98

    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_45

    .line 292
    .end local v7           #lights:Lcom/android/server/LightsService;
    .end local v9           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v61           #accountManager:Landroid/accounts/AccountManagerService;
    .end local v97           #installer:Lcom/android/server/pm/Installer;
    .end local v128           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v62       #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v63       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v67       #battery:Lcom/android/server/BatteryService;
    .restart local v96       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v98       #installer:Lcom/android/server/pm/Installer;
    .restart local v100       #lights:Lcom/android/server/LightsService;
    .restart local v129       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_5a
    move-exception v89

    move-object/from16 v61, v62

    .end local v62           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v61       #accountManager:Landroid/accounts/AccountManagerService;
    goto/16 :goto_44

    .end local v63           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v67           #battery:Lcom/android/server/BatteryService;
    .end local v81           #cryptState:Ljava/lang/String;
    .end local v93           #firstBoot:Z
    .end local v96           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v98           #installer:Lcom/android/server/pm/Installer;
    .end local v100           #lights:Lcom/android/server/LightsService;
    .end local v124           #setRTC:Z
    .end local v129           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v7       #lights:Lcom/android/server/LightsService;
    .restart local v9       #battery:Lcom/android/server/BatteryService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v64       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v79       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v82       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v87       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v94       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v97       #installer:Lcom/android/server/pm/Installer;
    .restart local v101       #location:Lcom/android/server/LocationManagerService;
    .restart local v103       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v112       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v126       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v128       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v132       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v144       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_1c
    move-object/from16 v26, v108

    .end local v108           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v26       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_3a
.end method
