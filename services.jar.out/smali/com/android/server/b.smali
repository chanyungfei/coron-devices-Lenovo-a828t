.class final Lcom/android/server/b;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/android/server/h;

.field private b:J

.field private c:J


# direct methods
.method constructor <init>(Lcom/android/server/h;)V
    .locals 2

    const-wide/16 v0, 0x0

    iput-object p1, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    iput-wide v0, p0, Lcom/android/server/b;->b:J

    iput-wide v0, p0, Lcom/android/server/b;->c:J

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 7

    const-wide/16 v5, 0x7d0

    const/4 v4, -0x1

    const/4 v3, 0x1

    const/4 v2, 0x0

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    invoke-static {}, Lcom/android/server/SysoffMonitor;->a()Ljava/lang/String;

    move-result-object v0

    const-string v1, "System off start"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/b;->b:J

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->c(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0, v3}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;Z)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->d(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->e(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-virtual {v0, v3}, Lcom/android/server/SysoffMonitor;->setSysoffConfig(Z)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->f(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->g(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->h(Lcom/android/server/SysoffMonitor;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/android/server/SysoffMonitor;->a()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Set persist property since turn on airplane mode when sysoff"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-virtual {v0, v3}, Lcom/android/server/SysoffMonitor;->setAirplaneOnProperty(Z)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0, v3}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;Z)V

    :cond_1
    :goto_1
    new-instance v0, Lcom/android/server/SysoffMonitor$CheckWirelessStateThread;

    iget-object v1, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v1, v1, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-direct {v0, v1}, Lcom/android/server/SysoffMonitor$CheckWirelessStateThread;-><init>(Lcom/android/server/SysoffMonitor;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->i(Lcom/android/server/SysoffMonitor;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->j(Lcom/android/server/SysoffMonitor;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_3
    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0, v2}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;Z)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/g;

    invoke-direct {v1, p0}, Lcom/android/server/g;-><init>(Lcom/android/server/b;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    :pswitch_1
    invoke-static {}, Lcom/android/server/SysoffMonitor;->a()Ljava/lang/String;

    move-result-object v0

    const-string v1, "System on start"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "ctl.start"

    const-string v1, "bootanim"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {}, Lcom/android/server/SysoffMonitor;->b()[J

    move-result-object v1

    invoke-static {v0, v1, v4}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;[JI)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->k(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v1, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    const-string v0, "window"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/WindowManagerService;

    invoke-static {v1, v0}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;Lcom/android/server/wm/WindowManagerService;)Lcom/android/server/wm/WindowManagerService;

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->l(Lcom/android/server/SysoffMonitor;)Lcom/android/server/wm/WindowManagerService;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/server/wm/WindowManagerService;->setEventDispatching(Z)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-virtual {v0}, Lcom/android/server/SysoffMonitor;->checkAirplaneOnProperty()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/android/server/SysoffMonitor;->a()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Clear persist airplane on property when syson"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-virtual {v0, v2}, Lcom/android/server/SysoffMonitor;->setAirplaneOnProperty(Z)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0, v2}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;Z)V

    :cond_4
    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-virtual {v0, v2}, Lcom/android/server/SysoffMonitor;->setSysoffConfig(Z)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/e;

    invoke-direct {v1, p0}, Lcom/android/server/e;-><init>(Lcom/android/server/b;)V

    const-wide/16 v2, 0x6a4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/c;

    invoke-direct {v1, p0}, Lcom/android/server/c;-><init>(Lcom/android/server/b;)V

    invoke-virtual {v0, v1, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->n(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->o(Lcom/android/server/SysoffMonitor;)Z

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->p(Lcom/android/server/SysoffMonitor;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/b;->c:J

    :goto_2
    iget-wide v0, p0, Lcom/android/server/b;->c:J

    iget-wide v2, p0, Lcom/android/server/b;->b:J

    sub-long/2addr v0, v2

    cmp-long v0, v0, v5

    if-gez v0, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/b;->c:J

    goto :goto_2

    :cond_5
    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->q(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {}, Lcom/android/server/SysoffMonitor;->c()[J

    move-result-object v1

    invoke-static {v0, v1, v4}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;[JI)V

    goto/16 :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-virtual {v0}, Lcom/android/server/SysoffMonitor;->checkAirplaneOnProperty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-virtual {v0, v2}, Lcom/android/server/SysoffMonitor;->setAirplaneOnProperty(Z)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0, v2}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;Z)V

    goto/16 :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->r(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->s(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->t(Lcom/android/server/SysoffMonitor;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->u(Lcom/android/server/SysoffMonitor;)V

    iget-object v0, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v1, v1, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    iget-object v1, v1, Lcom/android/server/SysoffMonitor;->a:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
