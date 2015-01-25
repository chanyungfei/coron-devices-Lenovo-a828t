.class final Lcom/android/server/e;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lcom/android/server/b;


# direct methods
.method constructor <init>(Lcom/android/server/b;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/e;->a:Lcom/android/server/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/android/server/e;->a:Lcom/android/server/b;

    iget-object v0, v0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->m(Lcom/android/server/SysoffMonitor;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/server/SysoffMonitor;->a()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Sending system off alarm intent"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/e;->a:Lcom/android/server/b;

    iget-object v0, v0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;)Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/android/server/e;->a:Lcom/android/server/b;

    iget-object v2, v2, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v2, v2, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v2}, Lcom/android/server/SysoffMonitor;->m(Lcom/android/server/SysoffMonitor;)Landroid/content/Intent;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/android/server/e;->a:Lcom/android/server/b;

    iget-object v0, v0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;Landroid/content/Intent;)Landroid/content/Intent;

    :cond_0
    return-void
.end method
