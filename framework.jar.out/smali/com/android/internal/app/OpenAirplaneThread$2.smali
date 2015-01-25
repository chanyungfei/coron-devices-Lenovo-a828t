.class final Lcom/android/internal/app/OpenAirplaneThread$2;
.super Ljava/lang/Object;
.source "OpenAirplaneThread.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/app/OpenAirplaneThread;->open(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter

    .prologue
    .line 80
    iput-object p1, p0, Lcom/android/internal/app/OpenAirplaneThread$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 82
    iget-object v0, p0, Lcom/android/internal/app/OpenAirplaneThread$2;->val$context:Landroid/content/Context;

    const/4 v1, 0x1

    #calls: Lcom/android/internal/app/OpenAirplaneThread;->changeAirplaneModeSystemSetting(Landroid/content/Context;Z)V
    invoke-static {v0, v1}, Lcom/android/internal/app/OpenAirplaneThread;->access$100(Landroid/content/Context;Z)V

    .line 83
    return-void
.end method
