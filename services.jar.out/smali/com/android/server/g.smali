.class final Lcom/android/server/g;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lcom/android/server/b;


# direct methods
.method constructor <init>(Lcom/android/server/b;)V
    .locals 0

    iput-object p1, p0, Lcom/android/server/g;->a:Lcom/android/server/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/android/server/g;->a:Lcom/android/server/b;

    iget-object v0, v0, Lcom/android/server/b;->a:Lcom/android/server/h;

    iget-object v0, v0, Lcom/android/server/h;->a:Lcom/android/server/SysoffMonitor;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/server/SysoffMonitor;->b(Lcom/android/server/SysoffMonitor;Z)V

    return-void
.end method
