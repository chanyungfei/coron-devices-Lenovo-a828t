.class public Lcom/android/internal/telephony/cat/TextAttribute;
.super Ljava/lang/Object;
.source "TextAttribute.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/android/internal/telephony/cat/TextAttribute;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public align:Lcom/android/internal/telephony/cat/TextAlignment;

.field public bold:Z

.field public color:Lcom/android/internal/telephony/cat/TextColor;

.field public colorBG:Lcom/android/internal/telephony/cat/TextColor;

.field public italic:Z

.field public length:I

.field public size:Lcom/android/internal/telephony/cat/FontSize;

.field public start:I

.field public strikeThrough:Z

.field public underlined:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 83
    new-instance v0, Lcom/android/internal/telephony/cat/TextAttribute$1;

    invoke-direct {v0}, Lcom/android/internal/telephony/cat/TextAttribute$1;-><init>()V

    sput-object v0, Lcom/android/internal/telephony/cat/TextAttribute;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IILcom/android/internal/telephony/cat/TextAlignment;Lcom/android/internal/telephony/cat/FontSize;ZZZZLcom/android/internal/telephony/cat/TextColor;Lcom/android/internal/telephony/cat/TextColor;)V
    .locals 0
    .parameter "start"
    .parameter "length"
    .parameter "align"
    .parameter "size"
    .parameter "bold"
    .parameter "italic"
    .parameter "underlined"
    .parameter "strikeThrough"
    .parameter "color"
    .parameter "colorBG"

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput p1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->start:I

    .line 42
    iput p2, p0, Lcom/android/internal/telephony/cat/TextAttribute;->length:I

    .line 43
    iput-object p3, p0, Lcom/android/internal/telephony/cat/TextAttribute;->align:Lcom/android/internal/telephony/cat/TextAlignment;

    .line 44
    iput-object p4, p0, Lcom/android/internal/telephony/cat/TextAttribute;->size:Lcom/android/internal/telephony/cat/FontSize;

    .line 45
    iput-boolean p5, p0, Lcom/android/internal/telephony/cat/TextAttribute;->bold:Z

    .line 46
    iput-boolean p6, p0, Lcom/android/internal/telephony/cat/TextAttribute;->italic:Z

    .line 47
    iput-boolean p7, p0, Lcom/android/internal/telephony/cat/TextAttribute;->underlined:Z

    .line 48
    iput-boolean p8, p0, Lcom/android/internal/telephony/cat/TextAttribute;->strikeThrough:Z

    .line 49
    iput-object p9, p0, Lcom/android/internal/telephony/cat/TextAttribute;->color:Lcom/android/internal/telephony/cat/TextColor;

    .line 50
    iput-object p10, p0, Lcom/android/internal/telephony/cat/TextAttribute;->colorBG:Lcom/android/internal/telephony/cat/TextColor;

    .line 51
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 5
    .parameter "in"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->start:I

    .line 55
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->length:I

    .line 56
    invoke-static {}, Lcom/android/internal/telephony/cat/TextAlignment;->values()[Lcom/android/internal/telephony/cat/TextAlignment;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    aget-object v1, v1, v4

    iput-object v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->align:Lcom/android/internal/telephony/cat/TextAlignment;

    .line 57
    invoke-static {}, Lcom/android/internal/telephony/cat/FontSize;->values()[Lcom/android/internal/telephony/cat/FontSize;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    aget-object v1, v1, v4

    iput-object v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->size:Lcom/android/internal/telephony/cat/FontSize;

    .line 58
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 59
    .local v0, format:I
    and-int/lit8 v1, v0, 0x10

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->bold:Z

    .line 60
    and-int/lit8 v1, v0, 0x20

    if-eqz v1, :cond_1

    move v1, v2

    :goto_1
    iput-boolean v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->italic:Z

    .line 61
    and-int/lit8 v1, v0, 0x40

    if-eqz v1, :cond_2

    move v1, v2

    :goto_2
    iput-boolean v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->underlined:Z

    .line 62
    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_3

    :goto_3
    iput-boolean v2, p0, Lcom/android/internal/telephony/cat/TextAttribute;->strikeThrough:Z

    .line 63
    invoke-static {}, Lcom/android/internal/telephony/cat/TextColor;->values()[Lcom/android/internal/telephony/cat/TextColor;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->color:Lcom/android/internal/telephony/cat/TextColor;

    .line 64
    invoke-static {}, Lcom/android/internal/telephony/cat/TextColor;->values()[Lcom/android/internal/telephony/cat/TextColor;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->colorBG:Lcom/android/internal/telephony/cat/TextColor;

    .line 65
    return-void

    :cond_0
    move v1, v3

    .line 59
    goto :goto_0

    :cond_1
    move v1, v3

    .line 60
    goto :goto_1

    :cond_2
    move v1, v3

    .line 61
    goto :goto_2

    :cond_3
    move v2, v3

    .line 62
    goto :goto_3
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/android/internal/telephony/cat/TextAttribute$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/cat/TextAttribute;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4
    .parameter "dest"
    .parameter "flags"

    .prologue
    const/4 v2, 0x0

    .line 72
    iget v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->start:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 73
    iget v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->length:I

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 74
    iget-object v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->align:Lcom/android/internal/telephony/cat/TextAlignment;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 75
    iget-object v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->size:Lcom/android/internal/telephony/cat/FontSize;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 76
    iget-boolean v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->bold:Z

    if-eqz v1, :cond_1

    const/16 v1, 0x10

    :goto_0
    iget-boolean v3, p0, Lcom/android/internal/telephony/cat/TextAttribute;->italic:Z

    if-eqz v3, :cond_2

    const/16 v3, 0x20

    :goto_1
    or-int/2addr v3, v1

    iget-boolean v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->underlined:Z

    if-eqz v1, :cond_3

    const/16 v1, 0x40

    :goto_2
    or-int/2addr v1, v3

    iget-boolean v3, p0, Lcom/android/internal/telephony/cat/TextAttribute;->strikeThrough:Z

    if-eqz v3, :cond_0

    const/16 v2, 0x80

    :cond_0
    or-int v0, v1, v2

    .line 78
    .local v0, format:I
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 79
    iget-object v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->color:Lcom/android/internal/telephony/cat/TextColor;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 80
    iget-object v1, p0, Lcom/android/internal/telephony/cat/TextAttribute;->colorBG:Lcom/android/internal/telephony/cat/TextColor;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 81
    return-void

    .end local v0           #format:I
    :cond_1
    move v1, v2

    .line 76
    goto :goto_0

    :cond_2
    move v3, v2

    goto :goto_1

    :cond_3
    move v1, v2

    goto :goto_2
.end method
