.class final Lcom/android/server/f;
.super Landroid/content/BroadcastReceiver;


# instance fields
.field private synthetic a:Lcom/android/server/SysoffMonitor;


# direct methods
.method constructor <init>(Lcom/android/server/SysoffMonitor;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/f;->a:Lcom/android/server/SysoffMonitor;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    const/4 v3, 0x2

    const/4 v2, 0x1

    const-string v0, "android.intent.action.SYSOFF"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    iput v2, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/android/server/f;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v1}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    const-string v0, "android.intent.action.SYSON"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    iput v3, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/android/server/f;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v1}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    const-string v0, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/android/server/f;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v1}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_2
    const-string v0, "com.android.deskclock.ALARM_ALERT"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/server/f;->a:Lcom/android/server/SysoffMonitor;

    invoke-virtual {v0}, Lcom/android/server/SysoffMonitor;->isSysoffConfig()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/server/f;->a:Lcom/android/server/SysoffMonitor;

    invoke-virtual {v0, v2}, Lcom/android/server/SysoffMonitor;->setSysonConfig(Z)V

    iget-object v0, p0, Lcom/android/server/f;->a:Lcom/android/server/SysoffMonitor;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-static {v0, v1}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;Landroid/content/Intent;)Landroid/content/Intent;

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    iput v3, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/android/server/f;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v1}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_3
    return-void
.end method
