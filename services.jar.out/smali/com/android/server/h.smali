.class final Lcom/android/server/h;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Lcom/android/server/SysoffMonitor;


# direct methods
.method constructor <init>(Lcom/android/server/SysoffMonitor;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    invoke-static {}, Landroid/os/Looper;->prepare()V

    iget-object v0, p0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    new-instance v1, Lcom/android/server/b;

    invoke-direct {v1, p0}, Lcom/android/server/b;-><init>(Lcom/android/server/h;)V

    invoke-static {v0, v1}, Lcom/android/server/SysoffMonitor;->a(Lcom/android/server/SysoffMonitor;Landroid/os/Handler;)Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->loop()V

    return-void
.end method
