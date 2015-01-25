.class public Lcom/android/server/ShutdownActivity;
.super Landroid/app/Activity;
.source "ShutdownActivity.java"


# static fields
.field private static final DIALOG_COUNTDOWN_POWER_OFF:I = 0x66

.field private static final DIALOG_COUNTDOWN_POWER_ON:I = 0x65

.field private static final DIALOG_COUNTDOWN_REBOOT:I = 0x67

.field private static final MIN_TIMEOUT:J = 0x7530L

.field private static final TAG:Ljava/lang/String; = "ShutdownActivity"

.field private static final UPDATE_RATE:J = 0x3e8L

.field public static isRunning:Z

.field private static mDialogId:I

.field private static mTriggerTime:J


# instance fields
.field private mConfirm:Z

.field private mHandler:Landroid/os/Handler;

.field private mInitialCallState:I

.field private mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private mReboot:Z

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;

.field protected updateTimeTask:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/ShutdownActivity;->isRunning:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 56
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/server/ShutdownActivity;->mHandler:Landroid/os/Handler;

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/ShutdownActivity;->mInitialCallState:I

    .line 68
    new-instance v0, Lcom/android/server/ShutdownActivity$1;

    invoke-direct {v0, p0}, Lcom/android/server/ShutdownActivity$1;-><init>(Lcom/android/server/ShutdownActivity;)V

    iput-object v0, p0, Lcom/android/server/ShutdownActivity;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 190
    new-instance v0, Lcom/android/server/ShutdownActivity$3;

    invoke-direct {v0, p0}, Lcom/android/server/ShutdownActivity$3;-><init>(Lcom/android/server/ShutdownActivity;)V

    iput-object v0, p0, Lcom/android/server/ShutdownActivity;->updateTimeTask:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/android/server/ShutdownActivity;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget v0, p0, Lcom/android/server/ShutdownActivity;->mInitialCallState:I

    return v0
.end method

.method static synthetic access$100(Lcom/android/server/ShutdownActivity;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Lcom/android/server/ShutdownActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/server/ShutdownActivity;Landroid/content/Context;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/android/server/ShutdownActivity;->setPowerOffNotification(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/server/ShutdownActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/android/server/ShutdownActivity;->mReboot:Z

    return v0
.end method

.method static synthetic access$400(Lcom/android/server/ShutdownActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/android/server/ShutdownActivity;->mConfirm:Z

    return v0
.end method

.method static synthetic access$500()J
    .locals 2

    .prologue
    .line 49
    sget-wide v0, Lcom/android/server/ShutdownActivity;->mTriggerTime:J

    return-wide v0
.end method

.method static synthetic access$600()I
    .locals 1

    .prologue
    .line 49
    sget v0, Lcom/android/server/ShutdownActivity;->mDialogId:I

    return v0
.end method

.method private buildTimeoutMessage(I)Ljava/lang/String;
    .locals 9
    .parameter "id"

    .prologue
    .line 304
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 305
    .local v4, sb:Ljava/lang/StringBuilder;
    sget-wide v5, Lcom/android/server/ShutdownActivity;->mTriggerTime:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long v0, v5, v7

    .line 306
    .local v0, left:J
    const-wide/16 v5, 0x0

    cmp-long v5, v0, v5

    if-gez v5, :cond_0

    const-wide/16 v0, 0x0

    .line 307
    :cond_0
    const-wide/16 v5, 0x3e8

    div-long v2, v0, v5

    .line 308
    .local v2, leftSec:J
    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 309
    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    const v5, 0x10403ba

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    const/16 v5, 0x66

    if-ne p1, v5, :cond_1

    .line 313
    const v5, 0x1040563

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const v8, 0x1040565

    invoke-virtual {p0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {p0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 322
    :goto_0
    return-object v5

    .line 315
    :cond_1
    const/16 v5, 0x65

    if-ne p1, v5, :cond_2

    .line 316
    const v5, 0x1040563

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const v8, 0x1040564

    invoke-virtual {p0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {p0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 318
    :cond_2
    const/16 v5, 0x67

    if-ne p1, v5, :cond_3

    .line 319
    const v5, 0x1040563

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const v8, 0x1040566

    invoke-virtual {p0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {p0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 322
    :cond_3
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private setPowerOffNotification(Landroid/content/Context;)V
    .locals 10
    .parameter "ctx"

    .prologue
    const v9, 0x1080078

    const/4 v8, 0x1

    .line 326
    if-nez p1, :cond_0

    .line 347
    :goto_0
    return-void

    .line 329
    :cond_0
    new-instance v4, Landroid/content/Intent;

    const-class v6, Lcom/android/server/ShutdownActivity;

    invoke-direct {v4, p1, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 330
    .local v4, notify:Landroid/content/Intent;
    const-string v6, "android.intent.action.ACTION_REQUEST_SHUTDOWN"

    invoke-virtual {v4, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 331
    const-string v6, "android.intent.extra.KEY_CONFIRM"

    invoke-virtual {v4, v6, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 332
    const/4 v6, 0x0

    invoke-static {p1, v9, v4, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 335
    .local v5, pendingNotify:Landroid/app/PendingIntent;
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 336
    .local v0, b:Landroid/app/Notification$Builder;
    const v6, 0x1040568

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 337
    .local v2, label:Ljava/lang/String;
    const v6, 0x1040569

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 338
    .local v1, content:Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v6

    const v7, 0x1080030

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v6

    invoke-virtual {v6, v1}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 340
    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 341
    invoke-virtual {v0, v2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    invoke-virtual {v6, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 342
    invoke-virtual {v0, v8}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    .line 344
    const-string v6, "notification"

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    .line 346
    .local v3, nm:Landroid/app/NotificationManager;
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v6

    invoke-virtual {v3, v9, v6}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .parameter "savedInstanceState"

    .prologue
    const-wide/16 v5, 0x7530

    const/16 v12, 0x66

    const/16 v11, 0x65

    const/4 v8, 0x1

    const/4 v10, 0x0

    .line 87
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 89
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 90
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, action:Ljava/lang/String;
    const-string v7, "android.intent.action.REBOOT"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/server/ShutdownActivity;->mReboot:Z

    .line 92
    const-string v7, "android.intent.extra.KEY_CONFIRM"

    invoke-virtual {v1, v7, v10}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/server/ShutdownActivity;->mConfirm:Z

    .line 93
    sput-boolean v8, Lcom/android/server/ShutdownActivity;->isRunning:Z

    .line 95
    const-string v7, "ro.com.android.landscape"

    invoke-static {v7, v10}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 96
    invoke-virtual {p0, v10}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 102
    :goto_0
    const-string v7, "ShutdownActivity"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "shutdown :  onCreate()  confirm="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, p0, Lcom/android/server/ShutdownActivity;->mConfirm:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    const-string v7, "android.intent.extra.TIMEOUT"

    const-wide/16 v8, -0x1

    invoke-virtual {v1, v7, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    .line 105
    .local v3, timeout:J
    const-wide/16 v7, 0x0

    cmp-long v7, v3, v7

    if-lez v7, :cond_6

    .line 106
    cmp-long v7, v3, v5

    if-gez v7, :cond_0

    move-wide v3, v5

    .line 107
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    add-long/2addr v5, v3

    sput-wide v5, Lcom/android/server/ShutdownActivity;->mTriggerTime:J

    .line 108
    const-string v5, "android.intent.action.ACTION_REQUEST_SHUTDOWN"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 109
    sput v12, Lcom/android/server/ShutdownActivity;->mDialogId:I

    .line 116
    :cond_1
    :goto_1
    const-string v5, "ShutdownActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "shutdown :  onCreate()  timeout="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " dialog_id:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget v7, Lcom/android/server/ShutdownActivity;->mDialogId:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v5

    const v6, 0x680081

    invoke-virtual {v5, v6}, Landroid/view/Window;->addFlags(I)V

    .line 125
    :goto_2
    sget v5, Lcom/android/server/ShutdownActivity;->mDialogId:I

    if-ne v5, v12, :cond_2

    .line 126
    const-string v5, "phone"

    invoke-virtual {p0, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/TelephonyManager;

    iput-object v5, p0, Lcom/android/server/ShutdownActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 127
    iget-object v5, p0, Lcom/android/server/ShutdownActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v5

    iput v5, p0, Lcom/android/server/ShutdownActivity;->mInitialCallState:I

    .line 128
    iget v5, p0, Lcom/android/server/ShutdownActivity;->mInitialCallState:I

    if-eqz v5, :cond_7

    .line 129
    const-string v5, "ShutdownActivity"

    const-string v6, "shutdown :  in call, stop shutdown"

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-direct {p0, p0}, Lcom/android/server/ShutdownActivity;->setPowerOffNotification(Landroid/content/Context;)V

    .line 132
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 138
    :cond_2
    :goto_3
    sget v5, Lcom/android/server/ShutdownActivity;->mDialogId:I

    if-lt v5, v11, :cond_8

    .line 163
    :goto_4
    return-void

    .line 98
    .end local v3           #timeout:J
    :cond_3
    invoke-virtual {p0, v8}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto/16 :goto_0

    .line 110
    .restart local v3       #timeout:J
    :cond_4
    const-string v5, "android.intent.action.ACTION_REQUEST_POWERON"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 111
    sput v11, Lcom/android/server/ShutdownActivity;->mDialogId:I

    goto :goto_1

    .line 112
    :cond_5
    const-string v5, "android.intent.action.REBOOT"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 113
    const/16 v5, 0x67

    sput v5, Lcom/android/server/ShutdownActivity;->mDialogId:I

    goto :goto_1

    .line 123
    :cond_6
    sput v10, Lcom/android/server/ShutdownActivity;->mDialogId:I

    goto :goto_2

    .line 134
    :cond_7
    iget-object v5, p0, Lcom/android/server/ShutdownActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v6, p0, Lcom/android/server/ShutdownActivity;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v7, 0x20

    invoke-virtual {v5, v6, v7}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    goto :goto_3

    .line 140
    :cond_8
    new-instance v2, Lcom/android/server/ShutdownActivity$2;

    const-string v5, "ShutdownActivity"

    invoke-direct {v2, p0, v5}, Lcom/android/server/ShutdownActivity$2;-><init>(Lcom/android/server/ShutdownActivity;Ljava/lang/String;)V

    .line 155
    .local v2, thr:Ljava/lang/Thread;
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 156
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 159
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    .line 160
    :catch_0
    move-exception v5

    goto :goto_4
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 10
    .parameter "id"

    .prologue
    const/high16 v9, 0x104

    const v8, 0x10400dd

    const v5, 0x1030309

    const/16 v7, 0x7d9

    const/4 v6, 0x0

    .line 213
    const-string v3, "ontim.ft.home.disable"

    const-string v4, "1"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    const/16 v3, 0x66

    if-ne p1, v3, :cond_0

    .line 215
    invoke-direct {p0, p1}, Lcom/android/server/ShutdownActivity;->buildTimeoutMessage(I)Ljava/lang/String;

    move-result-object v1

    .line 216
    .local v1, msg:Ljava/lang/String;
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v3, v8}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/android/server/ShutdownActivity$5;

    invoke-direct {v4, p0}, Lcom/android/server/ShutdownActivity$5;-><init>(Lcom/android/server/ShutdownActivity;)V

    invoke-virtual {v3, v8, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/android/server/ShutdownActivity$4;

    invoke-direct {v4, p0}, Lcom/android/server/ShutdownActivity$4;-><init>(Lcom/android/server/ShutdownActivity;)V

    invoke-virtual {v3, v9, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 236
    .local v0, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v0, v6}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 237
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/view/Window;->setType(I)V

    .line 289
    .end local v0           #dialog:Landroid/app/AlertDialog;
    .end local v1           #msg:Ljava/lang/String;
    :goto_0
    return-object v0

    .line 239
    :cond_0
    const/16 v3, 0x65

    if-ne p1, v3, :cond_1

    .line 240
    invoke-direct {p0, p1}, Lcom/android/server/ShutdownActivity;->buildTimeoutMessage(I)Ljava/lang/String;

    move-result-object v1

    .line 241
    .restart local v1       #msg:Ljava/lang/String;
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const v4, 0x1040564

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x1040564

    new-instance v5, Lcom/android/server/ShutdownActivity$7;

    invoke-direct {v5, p0}, Lcom/android/server/ShutdownActivity$7;-><init>(Lcom/android/server/ShutdownActivity;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/android/server/ShutdownActivity$6;

    invoke-direct {v4, p0}, Lcom/android/server/ShutdownActivity$6;-><init>(Lcom/android/server/ShutdownActivity;)V

    invoke-virtual {v3, v8, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 260
    .restart local v0       #dialog:Landroid/app/AlertDialog;
    invoke-virtual {v0, v6}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 261
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/view/Window;->setType(I)V

    goto :goto_0

    .line 263
    .end local v0           #dialog:Landroid/app/AlertDialog;
    .end local v1           #msg:Ljava/lang/String;
    :cond_1
    const/16 v3, 0x67

    if-ne p1, v3, :cond_2

    .line 264
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 265
    .local v2, sb:Ljava/lang/StringBuilder;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 266
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const v4, 0x1040567

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x1040567

    new-instance v5, Lcom/android/server/ShutdownActivity$9;

    invoke-direct {v5, p0}, Lcom/android/server/ShutdownActivity$9;-><init>(Lcom/android/server/ShutdownActivity;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/android/server/ShutdownActivity$8;

    invoke-direct {v4, p0}, Lcom/android/server/ShutdownActivity$8;-><init>(Lcom/android/server/ShutdownActivity;)V

    invoke-virtual {v3, v9, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 284
    .restart local v0       #dialog:Landroid/app/AlertDialog;
    invoke-virtual {v0, v6}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 285
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/view/Window;->setType(I)V

    goto/16 :goto_0

    .line 289
    .end local v0           #dialog:Landroid/app/AlertDialog;
    .end local v2           #sb:Ljava/lang/StringBuilder;
    :cond_2
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 181
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 182
    sput-boolean v2, Lcom/android/server/ShutdownActivity;->isRunning:Z

    .line 184
    const-string v0, "ontim.ft.home.disable"

    const-string v1, "0"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    iget-object v0, p0, Lcom/android/server/ShutdownActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/android/server/ShutdownActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/android/server/ShutdownActivity;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 188
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 175
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 177
    return-void
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 3
    .parameter "id"
    .parameter "dialog"

    .prologue
    .line 294
    const/16 v2, 0x65

    if-lt p1, v2, :cond_0

    move-object v0, p2

    .line 295
    check-cast v0, Landroid/app/AlertDialog;

    .line 296
    .local v0, aDialog:Landroid/app/AlertDialog;
    invoke-direct {p0, p1}, Lcom/android/server/ShutdownActivity;->buildTimeoutMessage(I)Ljava/lang/String;

    move-result-object v1

    .line 297
    .local v1, msg:Ljava/lang/String;
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 301
    .end local v0           #aDialog:Landroid/app/AlertDialog;
    .end local v1           #msg:Ljava/lang/String;
    :goto_0
    return-void

    .line 300
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onPrepareDialog(ILandroid/app/Dialog;)V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 166
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 167
    sget v0, Lcom/android/server/ShutdownActivity;->mDialogId:I

    const/16 v1, 0x65

    if-lt v0, v1, :cond_0

    .line 168
    iget-object v0, p0, Lcom/android/server/ShutdownActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/server/ShutdownActivity;->updateTimeTask:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 169
    sget v0, Lcom/android/server/ShutdownActivity;->mDialogId:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->showDialog(I)V

    .line 171
    :cond_0
    return-void
.end method
