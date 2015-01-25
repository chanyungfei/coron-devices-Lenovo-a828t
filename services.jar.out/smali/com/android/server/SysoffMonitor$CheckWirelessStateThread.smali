.class public Lcom/android/server/SysoffMonitor$CheckWirelessStateThread;
.super Ljava/lang/Thread;


# instance fields
.field private synthetic a:Lcom/android/server/SysoffMonitor;


# direct methods
.method public constructor <init>(Lcom/android/server/SysoffMonitor;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/SysoffMonitor$CheckWirelessStateThread;->a:Lcom/android/server/SysoffMonitor;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    const/16 v12, 0x18

    const/4 v3, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/android/server/SysoffMonitor$CheckWirelessStateThread;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    const-string v1, "phone"

    invoke-static {v1}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v8

    const-string v1, "bluetooth_manager"

    invoke-static {v1}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Landroid/bluetooth/IBluetoothManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothManager;

    move-result-object v9

    move v7, v2

    move v4, v2

    move v1, v2

    move v5, v2

    :goto_0
    if-gt v7, v12, :cond_2

    if-nez v1, :cond_9

    if-eqz v9, :cond_0

    :try_start_0
    invoke-interface {v9}, Landroid/bluetooth/IBluetoothManager;->isEnabled()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-nez v1, :cond_3

    :cond_0
    move v1, v3

    :goto_1
    move v6, v1

    :goto_2
    if-nez v5, :cond_1

    :try_start_1
    invoke-interface {v8}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    if-nez v1, :cond_4

    move v1, v3

    :goto_3
    move v5, v1

    :cond_1
    :goto_4
    if-nez v4, :cond_8

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v1

    if-nez v1, :cond_5

    move v1, v3

    :goto_5
    if-eqz v5, :cond_6

    if-eqz v6, :cond_6

    if-eqz v1, :cond_6

    invoke-static {}, Lcom/android/server/SysoffMonitor;->a()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Radio, BT, WIFI shutdown completed"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/android/server/SysoffMonitor$CheckWirelessStateThread;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v1}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_2
    :goto_6
    return-void

    :cond_3
    move v1, v2

    goto :goto_1

    :catch_0
    move-exception v1

    invoke-static {}, Lcom/android/server/SysoffMonitor;->a()Ljava/lang/String;

    move-result-object v6

    const-string v10, "RemoteException during bluetooth shutdown"

    invoke-static {v6, v10, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v6, v3

    goto :goto_2

    :cond_4
    move v1, v2

    goto :goto_3

    :catch_1
    move-exception v1

    invoke-static {}, Lcom/android/server/SysoffMonitor;->a()Ljava/lang/String;

    move-result-object v5

    const-string v10, "RemoteException during radio shutdown"

    invoke-static {v5, v10, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v5, v3

    goto :goto_4

    :cond_5
    move v1, v2

    goto :goto_5

    :cond_6
    if-ne v12, v7, :cond_7

    invoke-static {}, Lcom/android/server/SysoffMonitor;->a()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Wireless state is not ready in time, shutdown"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    invoke-static {v2, v0}, Lcom/android/server/power/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    goto :goto_6

    :cond_7
    const-wide/16 v10, 0x1f4

    invoke-static {v10, v11}, Landroid/os/SystemClock;->sleep(J)V

    add-int/lit8 v4, v7, 0x1

    move v7, v4

    move v4, v1

    move v1, v6

    goto :goto_0

    :cond_8
    move v1, v4

    goto :goto_5

    :cond_9
    move v6, v1

    goto :goto_2
.end method
