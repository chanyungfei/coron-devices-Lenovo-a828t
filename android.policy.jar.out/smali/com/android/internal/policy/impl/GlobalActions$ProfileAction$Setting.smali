.class Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;
.super Ljava/lang/Object;
.source "GlobalActions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Setting"
.end annotation


# instance fields
.field public iconid:I

.field public id:I

.field public index:I

.field public name:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;IIILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter "id"
    .parameter "iconid"
    .parameter "index"
    .parameter "name"

    .prologue
    .line 964
    iput-object p1, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->this$0:Lcom/android/internal/policy/impl/GlobalActions$ProfileAction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 965
    iput p2, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->id:I

    .line 966
    iput p3, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->iconid:I

    .line 967
    iput p4, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->index:I

    .line 968
    iput-object p5, p0, Lcom/android/internal/policy/impl/GlobalActions$ProfileAction$Setting;->name:Ljava/lang/String;

    .line 969
    return-void
.end method
