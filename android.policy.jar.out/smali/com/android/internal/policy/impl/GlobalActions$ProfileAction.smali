.class Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;
.super Ljava/lang/Object;
.source "GlobalActions.java"

# interfaces
.implements Lcom/android/internal/policy/impl/GlobalActions$Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/GlobalActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProfileAction"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;
    }
.end annotation


# static fields
.field private static final CONTENT_URI:Landroid/net/Uri; = null

.field private static final CURRENT_MODE:Ljava/lang/String; = "Current_mode"

.field private static final PROFILE_MODE:Ljava/lang/String; = "Profile_mode"


# instance fields
.field final QUERY_COLUMNS:[Ljava/lang/String;

.field private final Res_IDS:[I

.field private final STR_IDS:[I

.field private activeMode:I

.field private mChangeLock:Z

.field private mCtx:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mSettings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 937
    const-string v0, "content://com.android.profiles/tbl_profile"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 4
    .parameter "context"
    .parameter "handler"

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 972
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 931
    iput v2, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->activeMode:I

    .line 934
    iput-boolean v2, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mChangeLock:Z

    .line 939
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "profile_id"

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string v2, "idx"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "name"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "active"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->QUERY_COLUMNS:[Ljava/lang/String;

    .line 943
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->Res_IDS:[I

    .line 952
    new-array v0, v3, [I

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->STR_IDS:[I

    .line 973
    iput-object p1, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mCtx:Landroid/content/Context;

    .line 974
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    .line 975
    iput-object p2, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mHandler:Landroid/os/Handler;

    .line 976
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->readProfileSettings()V

    .line 977
    return-void

    .line 943
    :array_0
    .array-data 0x4
        0x8dt 0x3t 0x8t 0x1t
        0x8ft 0x3t 0x8t 0x1t
        0x8et 0x3t 0x8t 0x1t
        0x90t 0x3t 0x8t 0x1t
        0x8at 0x3t 0x8t 0x1t
        0x8bt 0x3t 0x8t 0x1t
        0x8ct 0x3t 0x8t 0x1t
    .end array-data

    .line 952
    :array_1
    .array-data 0x4
        0x6dt 0x5t 0x4t 0x1t
        0x6ct 0x5t 0x4t 0x1t
        0x6at 0x5t 0x4t 0x1t
        0x6bt 0x5t 0x4t 0x1t
    .end array-data
.end method


# virtual methods
.method public create(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 7
    .parameter "context"
    .parameter "convertView"
    .parameter "parent"
    .parameter "inflater"

    .prologue
    .line 981
    const v4, 0x1090043

    const/4 v5, 0x0

    invoke-virtual {p4, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 983
    .local v3, v:Landroid/view/View;
    const v4, 0x1020006

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 984
    .local v0, icon:Landroid/widget/ImageView;
    const v4, 0x102000b

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 986
    .local v1, messageView:Landroid/widget/TextView;
    const v4, 0x1020282

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 987
    .local v2, statusView:Landroid/widget/TextView;
    const v4, 0x104056e

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 990
    iget-object v4, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_0

    .line 991
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->Res_IDS:[I

    const/4 v6, 0x2

    aget v5, v5, v6

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 992
    const-string v4, ""

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 994
    iget-object v4, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 995
    const-string v4, "GlobalActions"

    const-string v5, "something bad happen"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1009
    :goto_0
    return-object v3

    .line 999
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-object v4, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    iget v6, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->activeMode:I

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;

    iget v4, v4, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->iconid:I

    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1002
    iget v4, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->activeMode:I

    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->STR_IDS:[I

    array-length v5, v5

    if-ge v4, v5, :cond_1

    .line 1003
    iget-object v4, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->STR_IDS:[I

    iget v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->activeMode:I

    aget v4, v4, v5

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 1005
    :cond_1
    iget-object v4, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    iget v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->activeMode:I

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;

    iget-object v4, v4, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->name:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 1067
    const/4 v0, 0x1

    return v0
.end method

.method public onLongPress()Z
    .locals 1

    .prologue
    .line 1071
    const/4 v0, 0x0

    return v0
.end method

.method public onPress()V
    .locals 8

    .prologue
    .line 1014
    iget-boolean v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mChangeLock:Z

    if-nez v5, :cond_1

    .line 1015
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mChangeLock:Z

    .line 1022
    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_2

    .line 1023
    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mHandler:Landroid/os/Handler;

    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1024
    const-string v5, "GlobalActions"

    const-string v6, "something bad happen"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1056
    :cond_0
    :goto_0
    return-void

    .line 1017
    :cond_1
    const-string v5, "GlobalActions"

    const-string v6, "don\'t be so hurry!"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1029
    :cond_2
    iget v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->activeMode:I

    iget-object v6, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_0

    .line 1033
    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    iget v6, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->activeMode:I

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;

    iget v5, v5, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->index:I

    add-int/lit8 v4, v5, 0x1

    .line 1034
    .local v4, nextindex:I
    const/16 v3, 0xff

    .line 1035
    .local v3, nextMode:I
    const/4 v0, 0x0

    .line 1036
    .local v0, firstMode:I
    const/4 v1, 0x0

    .local v1, idx:I
    :goto_1
    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 1037
    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;

    iget v5, v5, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->index:I

    if-nez v5, :cond_3

    .line 1038
    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;

    iget v0, v5, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->id:I

    .line 1040
    :cond_3
    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;

    iget v5, v5, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->index:I

    if-ne v5, v4, :cond_6

    .line 1041
    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;

    iget v3, v5, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->id:I

    .line 1046
    :cond_4
    const/16 v5, 0xff

    if-ne v3, v5, :cond_5

    .line 1047
    move v3, v0

    .line 1049
    :cond_5
    const-string v5, "GlobalActions"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "nextMode is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1050
    const-string v5, "GlobalActions"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "firstMode is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1052
    new-instance v2, Landroid/content/Intent;

    const-string v5, "com.android.profiles.action.ACTIVE_PROFILE"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1053
    .local v2, intent:Landroid/content/Intent;
    const-string v5, "Profile_mode"

    invoke-virtual {v2, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1054
    const-string v5, "Current_mode"

    iget v6, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->activeMode:I

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1055
    iget-object v5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mCtx:Landroid/content/Context;

    invoke-virtual {v5, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1036
    .end local v2           #intent:Landroid/content/Intent;
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_1
.end method

.method public readProfileSettings()V
    .locals 9

    .prologue
    const/4 v3, 0x0

    const/4 v8, 0x0

    .line 1075
    iget-object v2, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mCtx:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1076
    .local v0, cr:Landroid/content/ContentResolver;
    iget-object v2, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 1077
    sget-object v1, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->QUERY_COLUMNS:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1078
    .local v7, cursor:Landroid/database/Cursor;
    if-eqz v7, :cond_2

    .line 1079
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1080
    const/4 v2, 0x3

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->activeMode:I

    .line 1082
    :cond_0
    new-instance v1, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iget-object v2, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->Res_IDS:[I

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    aget v4, v2, v4

    const/4 v2, 0x1

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    const/4 v2, 0x2

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;-><init>(Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;IIILjava/lang/String;)V

    .line 1084
    .local v1, set:Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;
    iget-object v2, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mSettings:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1085
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1087
    .end local v1           #set:Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1089
    :cond_2
    iput-boolean v8, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;->mChangeLock:Z

    .line 1090
    return-void
.end method

.method public showBeforeProvisioning()Z
    .locals 1

    .prologue
    .line 1063
    const/4 v0, 0x0

    return v0
.end method

.method public showDuringKeyguard()Z
    .locals 1

    .prologue
    .line 1059
    const/4 v0, 0x1

    return v0
.end method
