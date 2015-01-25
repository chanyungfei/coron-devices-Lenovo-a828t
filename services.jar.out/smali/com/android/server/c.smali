.class final Lcom/android/server/c;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lcom/android/server/b;


# direct methods
.method constructor <init>(Lcom/android/server/b;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/c;->a:Lcom/android/server/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    const/4 v2, 0x0

    const-string v0, "ctl.stop"

    const-string v1, "bootanim"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/c;->a:Lcom/android/server/b;

    iget-object v0, v0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0}, Lcom/android/server/SysoffMonitor;->l(Lcom/android/server/SysoffMonitor;)Lcom/android/server/wm/WindowManagerService;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/server/wm/WindowManagerService;->setEventDispatching(Z)V

    iget-object v0, p0, Lcom/android/server/c;->a:Lcom/android/server/b;

    iget-object v0, v0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-static {v0, v2}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;Z)V

    iget-object v0, p0, Lcom/android/server/c;->a:Lcom/android/server/b;

    iget-object v0, v0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-virtual {v0, v2}, Lcom/android/server/SysoffMonitor;->setSysonConfig(Z)V

    return-void
.end method
