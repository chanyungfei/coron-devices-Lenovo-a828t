.class public final Lcom/android/internal/app/OpenAirplaneThread;
.super Ljava/lang/Thread;
.source "OpenAirplaneThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/app/OpenAirplaneThread$LocaleReceiver;
    }
.end annotation


# static fields
.field private static mContext:Landroid/content/Context;

.field private static mDialog:Landroid/app/AlertDialog;

.field private static final sInstance:Lcom/android/internal/app/OpenAirplaneThread;

.field private static sIsStarted:Z

.field private static sIsStartedGuard:Ljava/lang/Object;


# instance fields
.field private mActionDone:Z

.field private final mActionDoneSync:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 45
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/internal/app/OpenAirplaneThread;->sIsStartedGuard:Ljava/lang/Object;

    .line 46
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/internal/app/OpenAirplaneThread;->sIsStarted:Z

    .line 49
    new-instance v0, Lcom/android/internal/app/OpenAirplaneThread;

    invoke-direct {v0}, Lcom/android/internal/app/OpenAirplaneThread;-><init>()V

    sput-object v0, Lcom/android/internal/app/OpenAirplaneThread;->sInstance:Lcom/android/internal/app/OpenAirplaneThread;

    .line 53
    sput-object v1, Lcom/android/internal/app/OpenAirplaneThread;->mContext:Landroid/content/Context;

    .line 54
    sput-object v1, Lcom/android/internal/app/OpenAirplaneThread;->mDialog:Landroid/app/AlertDialog;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 51
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/OpenAirplaneThread;->mActionDoneSync:Ljava/lang/Object;

    .line 56
    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    invoke-static {p0, p1}, Lcom/android/internal/app/OpenAirplaneThread;->changeAirplaneModeSystemSetting(Landroid/content/Context;Z)V

    return-void
.end method

.method static synthetic access$202(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"

    .prologue
    .line 43
    sput-object p0, Lcom/android/internal/app/OpenAirplaneThread;->mDialog:Landroid/app/AlertDialog;

    return-object p0
.end method

.method private static changeAirplaneModeSystemSetting(Landroid/content/Context;Z)V
    .locals 4
    .parameter "context"
    .parameter "on"

    .prologue
    .line 111
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_on"

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 116
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 117
    .local v0, intent:Landroid/content/Intent;
    const/high16 v1, 0x2000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 118
    const-string/jumbo v1, "state"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 119
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 120
    return-void

    .line 111
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static open(Landroid/content/Context;Z)V
    .locals 5
    .parameter "context"
    .parameter "confirm"

    .prologue
    const/4 v4, 0x0

    .line 69
    sput-object p0, Lcom/android/internal/app/OpenAirplaneThread;->mContext:Landroid/content/Context;

    .line 70
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 71
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.LOCALE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 72
    sget-object v1, Lcom/android/internal/app/OpenAirplaneThread;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/android/internal/app/OpenAirplaneThread$LocaleReceiver;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/android/internal/app/OpenAirplaneThread$LocaleReceiver;-><init>(Lcom/android/internal/app/OpenAirplaneThread$1;)V

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 73
    sget-object v2, Lcom/android/internal/app/OpenAirplaneThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v2

    .line 74
    :try_start_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    if-eqz p1, :cond_2

    .line 76
    sget-object v1, Lcom/android/internal/app/OpenAirplaneThread;->mDialog:Landroid/app/AlertDialog;

    if-nez v1, :cond_1

    .line 77
    new-instance v1, Landroid/app/AlertDialog$Builder;

    const v2, 0x103030d

    invoke-direct {v1, p0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const v2, 0x1040014

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040574

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040013

    new-instance v3, Lcom/android/internal/app/OpenAirplaneThread$2;

    invoke-direct {v3, p0}, Lcom/android/internal/app/OpenAirplaneThread$2;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040009

    new-instance v3, Lcom/android/internal/app/OpenAirplaneThread$1;

    invoke-direct {v3}, Lcom/android/internal/app/OpenAirplaneThread$1;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    sput-object v1, Lcom/android/internal/app/OpenAirplaneThread;->mDialog:Landroid/app/AlertDialog;

    .line 93
    sget-object v1, Lcom/android/internal/app/OpenAirplaneThread;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x7d3

    invoke-virtual {v1, v2}, Landroid/view/Window;->setType(I)V

    .line 94
    sget-object v1, Lcom/android/internal/app/OpenAirplaneThread;->mDialog:Landroid/app/AlertDialog;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 95
    sget-object v1, Lcom/android/internal/app/OpenAirplaneThread;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 74
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 97
    :cond_1
    sget-object v1, Lcom/android/internal/app/OpenAirplaneThread;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 98
    sget-object v1, Lcom/android/internal/app/OpenAirplaneThread;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 102
    :cond_2
    invoke-static {p0, v4}, Lcom/android/internal/app/OpenAirplaneThread;->changeAirplaneModeSystemSetting(Landroid/content/Context;Z)V

    goto :goto_0
.end method
