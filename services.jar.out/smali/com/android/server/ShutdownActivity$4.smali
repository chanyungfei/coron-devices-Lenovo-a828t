.class Lcom/android/server/ShutdownActivity$4;
.super Ljava/lang/Object;
.source "ShutdownActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/ShutdownActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/ShutdownActivity;


# direct methods
.method constructor <init>(Lcom/android/server/ShutdownActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 228
    iput-object p1, p0, Lcom/android/server/ShutdownActivity$4;->this$0:Lcom/android/server/ShutdownActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 230
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/ShutdownActivity;->isRunning:Z

    .line 231
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$4;->this$0:Lcom/android/server/ShutdownActivity;

    #getter for: Lcom/android/server/ShutdownActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/ShutdownActivity;->access$100(Lcom/android/server/ShutdownActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/ShutdownActivity$4;->this$0:Lcom/android/server/ShutdownActivity;

    iget-object v1, v1, Lcom/android/server/ShutdownActivity;->updateTimeTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 232
    const-string v0, "ontim.ft.home.disable"

    const-string v1, "0"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    iget-object v0, p0, Lcom/android/server/ShutdownActivity$4;->this$0:Lcom/android/server/ShutdownActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 234
    return-void
.end method
