.class public Lcom/android/internal/telephony/PreferredPlmnInfo;
.super Ljava/lang/Object;
.source "PreferredPlmnInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/android/internal/telephony/PreferredPlmnInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field format:I

.field gsmAct:I

.field gsmCompactAct:I

.field index:I

.field oper:Ljava/lang/String;

.field utranAct:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 97
    new-instance v0, Lcom/android/internal/telephony/PreferredPlmnInfo$1;

    invoke-direct {v0}, Lcom/android/internal/telephony/PreferredPlmnInfo$1;-><init>()V

    sput-object v0, Lcom/android/internal/telephony/PreferredPlmnInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(IILjava/lang/String;III)V
    .locals 1
    .parameter "index"
    .parameter "Format"
    .parameter "oper"
    .parameter "gsmAct"
    .parameter "gsmCompactAct"
    .parameter "utranAct"

    .prologue
    const/4 v0, 0x0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->index:I

    .line 24
    iput v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->format:I

    .line 26
    iput v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->gsmAct:I

    .line 27
    iput v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->gsmCompactAct:I

    .line 28
    iput v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->utranAct:I

    .line 67
    iput p1, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->index:I

    .line 68
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->format:I

    iput v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->format:I

    .line 69
    iput-object p3, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->oper:Ljava/lang/String;

    .line 70
    iput p4, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->gsmAct:I

    .line 71
    iput p5, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->gsmCompactAct:I

    .line 72
    iput p6, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->utranAct:I

    .line 73
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 79
    const/4 v0, 0x0

    return v0
.end method

.method public getFormat()I
    .locals 1

    .prologue
    .line 37
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->format:I

    return v0
.end method

.method public getGsmAct()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->gsmAct:I

    return v0
.end method

.method public getGsmCompactAct()I
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->gsmCompactAct:I

    return v0
.end method

.method public getIndex()I
    .locals 1

    .prologue
    .line 32
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->index:I

    return v0
.end method

.method public getOper()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->oper:Ljava/lang/String;

    return-object v0
.end method

.method public getUtranAct()I
    .locals 1

    .prologue
    .line 57
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->utranAct:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .parameter "dest"
    .parameter "flags"

    .prologue
    .line 86
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->index:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 87
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->format:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 88
    iget-object v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->oper:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 89
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->gsmAct:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 90
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->gsmCompactAct:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 91
    iget v0, p0, Lcom/android/internal/telephony/PreferredPlmnInfo;->utranAct:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 92
    return-void
.end method
