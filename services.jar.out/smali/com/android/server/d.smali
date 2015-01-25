.class final Lcom/android/server/d;
.super Landroid/content/BroadcastReceiver;


# instance fields
.field private synthetic a:Lcom/android/server/SysoffMonitor;


# direct methods
.method constructor <init>(Lcom/android/server/SysoffMonitor;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/d;->a:Lcom/android/server/SysoffMonitor;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    const-string v0, "android.intent.action.SCREEN_OFF"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x5

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/android/server/d;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v1}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method
