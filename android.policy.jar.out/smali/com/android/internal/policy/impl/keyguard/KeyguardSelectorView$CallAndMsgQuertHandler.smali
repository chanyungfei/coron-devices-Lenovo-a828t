.class final Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView$CallAndMsgQuertHandler;
.super Landroid/content/AsyncQueryHandler;
.source "KeyguardSelectorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "CallAndMsgQuertHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;Landroid/content/ContentResolver;)V
    .locals 0
    .parameter
    .parameter "cr"

    .prologue
    .line 191
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView$CallAndMsgQuertHandler;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    .line 192
    invoke-direct {p0, p2}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 194
    return-void
.end method


# virtual methods
.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 4
    .parameter "token"
    .parameter "cookie"
    .parameter "cursor"

    .prologue
    .line 199
    if-eqz p3, :cond_0

    :try_start_0
    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_2

    .line 222
    :cond_0
    if-eqz p3, :cond_1

    .line 223
    invoke-interface {p3}, Landroid/database/Cursor;->close()V

    .line 226
    :cond_1
    :goto_0
    return-void

    .line 200
    :cond_2
    :try_start_1
    const-string v1, "KeyguardSelectorView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onQueryComplete token: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; mUnreadMessage: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView$CallAndMsgQuertHandler;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->mUnreadMessage:I
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->access$1200(Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 201
    packed-switch p1, :pswitch_data_0

    .line 222
    :goto_1
    if-eqz p3, :cond_1

    .line 223
    invoke-interface {p3}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 205
    :pswitch_0
    :try_start_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView$CallAndMsgQuertHandler;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->access$1212(Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;I)I

    .line 206
    const-string v1, "KeyguardSelectorView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onQueryComplete 111 mUnreadMessage: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView$CallAndMsgQuertHandler;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->mUnreadMessage:I
    invoke-static {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->access$1200(Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView$CallAndMsgQuertHandler;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->mGlowPadView:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->access$000(Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;)Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView$CallAndMsgQuertHandler;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->mUnreadMessage:I
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->access$1200(Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->setUnreadMsg(I)V

    .line 212
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView$CallAndMsgQuertHandler;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    const/4 v2, 0x0

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->mStartMmsSmsQuery:Z
    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->access$1302(Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;Z)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 222
    :catchall_0
    move-exception v1

    if-eqz p3, :cond_3

    .line 223
    invoke-interface {p3}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v1

    .line 215
    :pswitch_1
    :try_start_3
    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 216
    .local v0, count2:I
    const-string v1, "KeyguardSelectorView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onQueryComplete count2: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView$CallAndMsgQuertHandler;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->mGlowPadView:Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->access$000(Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;)Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/internal/widget/multiwaveview/KeyguardGlowPadView;->setMissedCall(I)V

    .line 218
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView$CallAndMsgQuertHandler;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;

    const/4 v2, 0x0

    #setter for: Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->mStartCallQuery:Z
    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;->access$1402(Lcom/android/internal/policy/impl/keyguard/KeyguardSelectorView;Z)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 201
    nop

    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
