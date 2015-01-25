.class public Lcom/android/internal/telephony/AdnRecord;
.super Ljava/lang/Object;
.source "AdnRecord.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field static final ADN_BCD_NUMBER_LENGTH:I = 0x0

.field static final ADN_CAPABILITY_ID:I = 0xc

.field static final ADN_DIALING_NUMBER_END:I = 0xb

.field static final ADN_DIALING_NUMBER_START:I = 0x2

.field static final ADN_EXTENSION_ID:I = 0xd

.field static final ADN_TON_AND_NPI:I = 0x1

.field public static final ANR_ADN_RECORD_IDENTIFIER:I = 0x10

.field public static final ANR_ADN_SFI:I = 0xf

.field public static final ANR_BCD_NUMBER_LENGTH:I = 0x1

.field public static final ANR_CAPABILITY_ID:I = 0xd

.field public static final ANR_DIALING_NUMBER_END:I = 0xc

.field public static final ANR_DIALING_NUMBER_START:I = 0x3

.field public static final ANR_EXTENSION_ID:I = 0xe

.field public static final ANR_TON_AND_NPI:I = 0x2

.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/android/internal/telephony/AdnRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXT_RECORD_LENGTH_BYTES:I = 0xd

.field public static final EXT_RECORD_TYPE_ADDITIONAL_DATA:I = 0x2

.field public static final EXT_RECORD_TYPE_MASK:I = 0x3

.field static final FOOTER_SIZE_BYTES:I = 0xe

.field static final LOG_TAG:Ljava/lang/String; = "GSM"

.field public static final MAX_EXT_CALLED_PARTY_LENGTH:I = 0xa

.field public static final MAX_GROUP_SIZE_BYTES:I = 0xa

.field static final MAX_NUMBER_SIZE_BYTES:I = 0xb

.field private static TAG:Ljava/lang/String;


# instance fields
.field alphaTag:Ljava/lang/String;

.field public anrEfids:[I

.field public anrFileTypes:[I

.field public anrIndexes:[I

.field public anrs:[Ljava/lang/String;

.field efid:I

.field public emailEfids:[I

.field public emailFileTypes:[I

.field public emailIndexes:[I

.field public emails:[Ljava/lang/String;

.field extRecord:I

.field extRecordAnr0:I

.field public grpEfid:I

.field public grps:[B

.field number:Ljava/lang/String;

.field public recordNumber:I

.field public sneEfids:[I

.field public sneFileTypes:[I

.field public sneIndexes:[I

.field public snes:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-string v0, "AdnRecord"

    sput-object v0, Lcom/android/internal/telephony/AdnRecord;->TAG:Ljava/lang/String;

    .line 127
    new-instance v0, Lcom/android/internal/telephony/AdnRecord$1;

    invoke-direct {v0}, Lcom/android/internal/telephony/AdnRecord$1;-><init>()V

    sput-object v0, Lcom/android/internal/telephony/AdnRecord;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "efid"
    .parameter "recordNumber"
    .parameter "alphaTag"
    .parameter "number"

    .prologue
    const/16 v1, 0xff

    const/4 v0, 0x0

    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 38
    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 68
    iput v1, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 70
    iput v1, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 194
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 195
    iput p2, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 196
    iput-object p3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 197
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 198
    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 199
    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 200
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2
    .parameter "efid"
    .parameter "recordNumber"
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"

    .prologue
    const/4 v1, 0x0

    const/16 v0, 0xff

    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 38
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 68
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 70
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 221
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 222
    iput p2, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 223
    iput-object p3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 224
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 225
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 226
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;[I[I[I)V
    .locals 2
    .parameter "efid"
    .parameter "recordNumber"
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"
    .parameter "emailEfids"
    .parameter "emailIndexes"
    .parameter "emailFileTypes"

    .prologue
    const/4 v1, 0x0

    const/16 v0, 0xff

    .line 262
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 38
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 68
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 70
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 263
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 264
    iput p2, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 265
    iput-object p3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 266
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 267
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 268
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    .line 269
    iput-object p7, p0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    .line 270
    iput-object p8, p0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    .line 271
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2
    .parameter "efid"
    .parameter "recordNumber"
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"
    .parameter "anrs"

    .prologue
    const/4 v1, 0x0

    const/16 v0, 0xff

    .line 229
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 38
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 68
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 70
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 230
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 231
    iput p2, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 232
    iput-object p3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 233
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 234
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 235
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 236
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[B)V
    .locals 2
    .parameter "efid"
    .parameter "recordNumber"
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"
    .parameter "anrs"
    .parameter "grps"

    .prologue
    const/4 v1, 0x0

    const/16 v0, 0xff

    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 38
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 68
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 70
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 240
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 241
    iput p2, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 242
    iput-object p3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 243
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 244
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 245
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 246
    iput-object p7, p0, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    .line 247
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[I[I[I[I[I[I)V
    .locals 2
    .parameter "efid"
    .parameter "recordNumber"
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"
    .parameter "anrs"
    .parameter "emailEfids"
    .parameter "anrEfids"
    .parameter "emailIndexes"
    .parameter "anrIndexes"
    .parameter "emailFileTypes"
    .parameter "anrFileTypes"

    .prologue
    const/4 v1, 0x0

    const/16 v0, 0xff

    .line 275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 38
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 68
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 70
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 276
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 277
    iput p2, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 278
    iput-object p3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 279
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 280
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 281
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 282
    iput-object p7, p0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    .line 283
    iput-object p8, p0, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    .line 284
    iput-object p9, p0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    .line 285
    iput-object p10, p0, Lcom/android/internal/telephony/AdnRecord;->anrIndexes:[I

    .line 286
    iput-object p11, p0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    .line 287
    iput-object p12, p0, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    .line 288
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[I[I[I[I[I[I[BI)V
    .locals 1
    .parameter "efid"
    .parameter "recordNumber"
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"
    .parameter "anrs"
    .parameter "emailEfids"
    .parameter "anrEfids"
    .parameter "emailIndexes"
    .parameter "anrIndexes"
    .parameter "emailFileTypes"
    .parameter "anrFileTypes"
    .parameter "grps"
    .parameter "grpEfid"

    .prologue
    .line 292
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 68
    const/16 v0, 0xff

    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 70
    const/16 v0, 0xff

    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 293
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 294
    iput p2, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 295
    iput-object p3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 296
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 297
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 298
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 299
    iput-object p7, p0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    .line 300
    iput-object p8, p0, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    .line 301
    iput-object p9, p0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    .line 302
    iput-object p10, p0, Lcom/android/internal/telephony/AdnRecord;->anrIndexes:[I

    .line 303
    iput-object p11, p0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    .line 304
    iput-object p12, p0, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    .line 305
    iput-object p13, p0, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    .line 306
    iput p14, p0, Lcom/android/internal/telephony/AdnRecord;->grpEfid:I

    .line 307
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[B)V
    .locals 2
    .parameter "efid"
    .parameter "recordNumber"
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"
    .parameter "anrs"
    .parameter "snes"
    .parameter "grps"

    .prologue
    const/4 v1, 0x0

    const/16 v0, 0xff

    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 38
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 68
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 70
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 251
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 252
    iput p2, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 253
    iput-object p3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 254
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 255
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 256
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 257
    iput-object p7, p0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    .line 258
    iput-object p8, p0, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    .line 259
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[I[I[I[I[I[I[I[I[I[BI)V
    .locals 2
    .parameter "efid"
    .parameter "recordNumber"
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"
    .parameter "anrs"
    .parameter "snes"
    .parameter "emailEfids"
    .parameter "anrEfids"
    .parameter "sneEfids"
    .parameter "emailIndexes"
    .parameter "anrIndexes"
    .parameter "sneIndexes"
    .parameter "emailFileTypes"
    .parameter "anrFileTypes"
    .parameter "sneFileTypes"
    .parameter "grps"
    .parameter "grpEfid"

    .prologue
    .line 312
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 38
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 68
    const/16 v1, 0xff

    iput v1, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 70
    const/16 v1, 0xff

    iput v1, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 313
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 314
    iput p2, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 315
    iput-object p3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 316
    iput-object p4, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 317
    iput-object p5, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 318
    iput-object p6, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 319
    iput-object p7, p0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    .line 320
    iput-object p8, p0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    .line 321
    iput-object p9, p0, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    .line 322
    iput-object p10, p0, Lcom/android/internal/telephony/AdnRecord;->sneEfids:[I

    .line 323
    iput-object p11, p0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    .line 324
    iput-object p12, p0, Lcom/android/internal/telephony/AdnRecord;->anrIndexes:[I

    .line 325
    iput-object p13, p0, Lcom/android/internal/telephony/AdnRecord;->sneIndexes:[I

    .line 326
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    .line 327
    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    .line 328
    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->sneFileTypes:[I

    .line 329
    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    .line 330
    move/from16 v0, p18

    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->grpEfid:I

    .line 331
    return-void
.end method

.method public constructor <init>(II[B)V
    .locals 2
    .parameter "efid"
    .parameter "recordNumber"
    .parameter "record"

    .prologue
    const/4 v1, 0x0

    const/16 v0, 0xff

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 38
    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 68
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 70
    iput v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 184
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    .line 185
    iput p2, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    .line 186
    invoke-direct {p0, p3}, Lcom/android/internal/telephony/AdnRecord;->parseRecord([B)V

    .line 187
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "alphaTag"
    .parameter "number"

    .prologue
    const/4 v1, 0x0

    .line 190
    const/4 v5, 0x0

    move-object v0, p0

    move v2, v1

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/AdnRecord;-><init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 191
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"

    .prologue
    const/4 v1, 0x0

    .line 203
    move-object v0, p0

    move v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/AdnRecord;-><init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 204
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 7
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"
    .parameter "anrs"

    .prologue
    const/4 v1, 0x0

    .line 207
    move-object v0, p0

    move v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/android/internal/telephony/AdnRecord;-><init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 208
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[B)V
    .locals 8
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"
    .parameter "anrs"
    .parameter "grps"

    .prologue
    const/4 v1, 0x0

    .line 212
    move-object v0, p0

    move v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/android/internal/telephony/AdnRecord;-><init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[B)V

    .line 213
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[B)V
    .locals 9
    .parameter "alphaTag"
    .parameter "number"
    .parameter "emails"
    .parameter "anrs"
    .parameter "snes"
    .parameter "grps"

    .prologue
    const/4 v1, 0x0

    .line 217
    move-object v0, p0

    move v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/android/internal/telephony/AdnRecord;-><init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[B)V

    .line 218
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .parameter "record"

    .prologue
    const/4 v0, 0x0

    .line 180
    invoke-direct {p0, v0, v0, p1}, Lcom/android/internal/telephony/AdnRecord;-><init>(II[B)V

    .line 181
    return-void
.end method

.method static bubblesort([B)[B
    .locals 5
    .parameter "a"

    .prologue
    .line 623
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v3, p0

    if-ge v0, v3, :cond_2

    .line 624
    const/4 v1, 0x0

    .local v1, j:I
    :goto_1
    array-length v3, p0

    sub-int/2addr v3, v0

    add-int/lit8 v3, v3, -0x1

    if-ge v1, v3, :cond_1

    .line 625
    aget-byte v3, p0, v1

    add-int/lit8 v4, v1, 0x1

    aget-byte v4, p0, v4

    if-le v3, v4, :cond_0

    .line 626
    aget-byte v2, p0, v1

    .line 627
    .local v2, temp:B
    add-int/lit8 v3, v1, 0x1

    aget-byte v3, p0, v3

    aput-byte v3, p0, v1

    .line 628
    add-int/lit8 v3, v1, 0x1

    aput-byte v2, p0, v3

    .line 624
    .end local v2           #temp:B
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 623
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 632
    .end local v1           #j:I
    :cond_2
    return-object p0
.end method

.method private byteArrayCompareNullEqualsEmpty([B[B)Z
    .locals 5
    .parameter "bytes1"
    .parameter "bytes2"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 599
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecord;->isbyteArrayEmpty([B)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/AdnRecord;->isbyteArrayEmpty([B)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecord;->isbyteArrayEmpty([B)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/AdnRecord;->isbyteArrayEmpty([B)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_1
    move v1, v2

    .line 618
    :cond_2
    :goto_0
    return v1

    .line 604
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecord;->isbyteArrayEmpty([B)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/AdnRecord;->isbyteArrayEmpty([B)Z

    move-result v3

    if-nez v3, :cond_2

    .line 608
    :cond_4
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 609
    goto :goto_0

    .line 611
    :cond_5
    invoke-static {p1}, Lcom/android/internal/telephony/AdnRecord;->bubblesort([B)[B

    move-result-object p1

    .line 612
    invoke-static {p2}, Lcom/android/internal/telephony/AdnRecord;->bubblesort([B)[B

    move-result-object p2

    .line 613
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v3, p1

    if-ge v0, v3, :cond_2

    .line 614
    aget-byte v3, p1, v0

    aget-byte v4, p2, v0

    invoke-static {v3, v4}, Lcom/android/internal/telephony/AdnRecord;->byteCompareNullEqualsEmpty(BB)Z

    move-result v3

    if-nez v3, :cond_6

    move v1, v2

    .line 615
    goto :goto_0

    .line 613
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static byteCompareNullEqualsEmpty(BB)Z
    .locals 1
    .parameter "b1"
    .parameter "b2"

    .prologue
    .line 592
    if-ne p0, p1, :cond_0

    .line 593
    const/4 v0, 0x1

    .line 595
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private gbEncoding(Ljava/lang/String;)[B
    .locals 6
    .parameter "gbString"

    .prologue
    .line 801
    const/4 v2, 0x0

    .line 804
    .local v2, result:[B
    :try_start_0
    const-string v3, "utf-16BE"

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 805
    .local v0, byteTag:[B
    array-length v3, v0

    add-int/lit8 v3, v3, 0x1

    new-array v2, v3, [B

    .line 806
    const/4 v3, 0x0

    const/16 v4, -0x80

    aput-byte v4, v2, v3

    .line 807
    const/4 v3, 0x0

    const/4 v4, 0x1

    array-length v5, v0

    invoke-static {v0, v3, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 811
    .end local v0           #byteTag:[B
    :goto_0
    return-object v2

    .line 808
    :catch_0
    move-exception v1

    .line 809
    .local v1, ex:Ljava/io/UnsupportedEncodingException;
    const-string v3, "GSM"

    const-string v4, "alphaTag convert byte exception"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private parseRecord([B)V
    .locals 6
    .parameter "record"

    .prologue
    const/4 v5, 0x0

    .line 849
    const/4 v3, 0x0

    :try_start_0
    array-length v4, p1

    add-int/lit8 v4, v4, -0xe

    invoke-static {p1, v3, v4}, Lcom/android/internal/telephony/IccUtils;->adnStringFieldToString([BII)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 852
    array-length v3, p1

    add-int/lit8 v1, v3, -0xe

    .line 854
    .local v1, footerOffset:I
    aget-byte v3, p1, v1

    and-int/lit16 v2, v3, 0xff

    .line 856
    .local v2, numberLength:I
    const/16 v3, 0xb

    if-le v2, v3, :cond_0

    .line 858
    const-string v3, ""

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 904
    .end local v1           #footerOffset:I
    .end local v2           #numberLength:I
    :goto_0
    return-void

    .line 869
    .restart local v1       #footerOffset:I
    .restart local v2       #numberLength:I
    :cond_0
    add-int/lit8 v3, v1, 0x1

    invoke-static {p1, v3, v2}, Landroid/telephony/PhoneNumberUtils;->calledPartyBCDToString([BII)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 872
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    iput v3, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    .line 874
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 875
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    .line 876
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    .line 877
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    .line 878
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 879
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    .line 880
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->anrIndexes:[I

    .line 881
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    .line 882
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    .line 883
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->sneEfids:[I

    .line 884
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->sneIndexes:[I

    .line 885
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->sneFileTypes:[I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 887
    .end local v1           #footerOffset:I
    .end local v2           #numberLength:I
    :catch_0
    move-exception v0

    .line 888
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v3, "GSM"

    const-string v4, "Error parsing AdnRecord"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 889
    const-string v3, ""

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    .line 890
    const-string v3, ""

    iput-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    .line 891
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 892
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    .line 893
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    .line 894
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    .line 895
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 896
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    .line 897
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->anrIndexes:[I

    .line 898
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    .line 899
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    .line 900
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->sneEfids:[I

    .line 901
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->sneIndexes:[I

    .line 902
    iput-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->sneFileTypes:[I

    goto :goto_0
.end method

.method private stringArrayCompareNullEqualsEmpty([Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 13
    .parameter "ss1"
    .parameter "ss2"

    .prologue
    .line 522
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_2

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 524
    :cond_1
    const/4 v11, 0x0

    .line 552
    :goto_0
    return v11

    .line 527
    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 528
    const/4 v11, 0x1

    goto :goto_0

    .line 530
    :cond_3
    array-length v11, p1

    new-array v9, v11, [Ljava/lang/String;

    .line 531
    .local v9, ssc1:[Ljava/lang/String;
    array-length v11, p2

    new-array v10, v11, [Ljava/lang/String;

    .line 532
    .local v10, ssc2:[Ljava/lang/String;
    const/4 v3, 0x0

    .line 533
    .local v3, index1:I
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/String;
    array-length v7, v0

    .local v7, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    move v4, v3

    .end local v3           #index1:I
    .local v4, index1:I
    :goto_1
    if-ge v2, v7, :cond_4

    aget-object v8, v0, v2

    .line 534
    .local v8, s:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_a

    .line 535
    add-int/lit8 v3, v4, 0x1

    .end local v4           #index1:I
    .restart local v3       #index1:I
    aput-object v8, v9, v4

    .line 533
    :goto_2
    add-int/lit8 v2, v2, 0x1

    move v4, v3

    .end local v3           #index1:I
    .restart local v4       #index1:I
    goto :goto_1

    .line 538
    .end local v8           #s:Ljava/lang/String;
    :cond_4
    const/4 v5, 0x0

    .line 539
    .local v5, index2:I
    move-object v0, p2

    array-length v7, v0

    const/4 v2, 0x0

    move v6, v5

    .end local v5           #index2:I
    .local v6, index2:I
    :goto_3
    if-ge v2, v7, :cond_5

    aget-object v8, v0, v2

    .line 540
    .restart local v8       #s:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_9

    .line 541
    add-int/lit8 v5, v6, 0x1

    .end local v6           #index2:I
    .restart local v5       #index2:I
    aput-object v8, v10, v6

    .line 539
    :goto_4
    add-int/lit8 v2, v2, 0x1

    move v6, v5

    .end local v5           #index2:I
    .restart local v6       #index2:I
    goto :goto_3

    .line 544
    .end local v8           #s:Ljava/lang/String;
    :cond_5
    if-eq v4, v6, :cond_6

    .line 545
    const/4 v11, 0x0

    goto :goto_0

    .line 547
    :cond_6
    const/4 v1, 0x0

    .local v1, i:I
    :goto_5
    if-ge v1, v4, :cond_8

    .line 548
    aget-object v11, v9, v1

    aget-object v12, v10, v1

    invoke-static {v11, v12}, Lcom/android/internal/telephony/AdnRecord;->stringCompareNullEqualsEmpty(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_7

    .line 549
    const/4 v11, 0x0

    goto :goto_0

    .line 547
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 552
    :cond_8
    const/4 v11, 0x1

    goto :goto_0

    .end local v1           #i:I
    .restart local v8       #s:Ljava/lang/String;
    :cond_9
    move v5, v6

    .end local v6           #index2:I
    .restart local v5       #index2:I
    goto :goto_4

    .end local v5           #index2:I
    :cond_a
    move v3, v4

    .end local v4           #index1:I
    .restart local v3       #index1:I
    goto :goto_2
.end method

.method private stringArrayMatch([Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 5
    .parameter "ss1"
    .parameter "ss2"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 565
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_1
    move v1, v2

    .line 588
    :cond_2
    :goto_0
    return v1

    .line 570
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 574
    :cond_4
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_6

    .line 575
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v3, p1

    if-ge v0, v3, :cond_2

    .line 576
    aget-object v3, p1, v0

    invoke-direct {p0, v3, p2}, Lcom/android/internal/telephony/AdnRecord;->stringInArray(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 577
    goto :goto_0

    .line 575
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 581
    .end local v0           #i:I
    :cond_6
    const/4 v0, 0x0

    .restart local v0       #i:I
    :goto_2
    array-length v3, p2

    if-ge v0, v3, :cond_2

    .line 582
    aget-object v3, p2, v0

    invoke-direct {p0, v3, p1}, Lcom/android/internal/telephony/AdnRecord;->stringInArray(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_7

    move v1, v2

    .line 583
    goto :goto_0

    .line 581
    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method private static stringCompareNullEqualsEmpty(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "s1"
    .parameter "s2"

    .prologue
    .line 507
    if-ne p0, p1, :cond_0

    .line 508
    const/4 v0, 0x1

    .line 518
    :goto_0
    return v0

    .line 510
    :cond_0
    if-nez p0, :cond_1

    .line 511
    const-string p0, ""

    .line 513
    :cond_1
    if-nez p1, :cond_2

    .line 514
    const-string p1, ""

    .line 516
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 517
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 518
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method private stringInArray(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 2
    .parameter "s"
    .parameter "arr"

    .prologue
    .line 556
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 557
    aget-object v1, p2, v0

    invoke-static {p1, v1}, Lcom/android/internal/telephony/AdnRecord;->stringCompareNullEqualsEmpty(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 558
    const/4 v1, 0x1

    .line 561
    :goto_1
    return v1

    .line 556
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 561
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method


# virtual methods
.method public appendExtRecord([B)V
    .locals 4
    .parameter "extRecord"

    .prologue
    const/4 v3, 0x2

    .line 819
    if-eqz p1, :cond_0

    :try_start_0
    array-length v1, p1

    const/16 v2, 0xd

    if-eq v1, v2, :cond_1

    .line 840
    :cond_0
    :goto_0
    return-void

    .line 823
    :cond_1
    const/4 v1, 0x0

    aget-byte v1, p1, v1

    and-int/lit8 v1, v1, 0x3

    if-ne v1, v3, :cond_0

    .line 827
    const/4 v1, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0xa

    if-gt v1, v2, :cond_0

    .line 832
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    invoke-static {p1, v2, v3}, Landroid/telephony/PhoneNumberUtils;->calledPartyBCDFragmentToString([BII)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 837
    :catch_0
    move-exception v0

    .line 838
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v1, "GSM"

    const-string v2, "Error parsing AdnRecord ext record"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public buildAdnString(I)[B
    .locals 11
    .parameter "recordSize"

    .prologue
    const/4 v5, 0x0

    const/4 v10, 0x1

    const/4 v9, -0x1

    const/4 v8, 0x0

    .line 719
    add-int/lit8 v3, p1, -0xe

    .line 722
    .local v3, footerOffset:I
    new-array v0, p1, [B

    .line 723
    .local v0, adnString:[B
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, p1, :cond_0

    .line 724
    aput-byte v9, v0, v4

    .line 723
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 728
    :cond_0
    iget-object v6, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x14

    if-le v6, v7, :cond_2

    .line 729
    const-string v6, "GSM"

    const-string v7, "[buildAdnString] Max length of dialing number is 20"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v5

    .line 772
    .end local v0           #adnString:[B
    .end local v3           #footerOffset:I
    :cond_1
    :goto_1
    return-object v0

    .line 732
    .restart local v0       #adnString:[B
    .restart local v3       #footerOffset:I
    :cond_2
    iget-object v6, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-le v6, v3, :cond_3

    .line 733
    const-string v6, "GSM"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[buildAdnString] Max length of tag is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v5

    .line 735
    goto :goto_1

    .line 738
    :cond_3
    iget-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 739
    const-string v5, "GSM"

    const-string v6, "[buildAdnString] Empty dialing number"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    new-array v1, v10, [B

    .line 741
    .local v1, bcdNumber:[B
    aput-byte v9, v1, v8

    .line 742
    add-int/lit8 v5, v3, 0x0

    aput-byte v9, v0, v5

    .line 750
    :goto_2
    add-int/lit8 v5, v3, 0x1

    array-length v6, v1

    invoke-static {v1, v8, v0, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 753
    add-int/lit8 v5, v3, 0xc

    aput-byte v9, v0, v5

    .line 755
    add-int/lit8 v5, v3, 0xd

    aput-byte v9, v0, v5

    .line 758
    iget-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 759
    iget-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    array-length v5, v5

    iget-object v6, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-eq v5, v6, :cond_7

    .line 760
    iget-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/AdnRecord;->gbEncoding(Ljava/lang/String;)[B

    move-result-object v2

    .line 761
    .local v2, byteTag:[B
    array-length v5, v2

    if-le v5, v3, :cond_6

    .line 762
    rem-int/lit8 v5, v3, 0x2

    if-ne v5, v10, :cond_5

    .end local v3           #footerOffset:I
    :goto_3
    invoke-static {v2, v8, v0, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1

    .line 745
    .end local v1           #bcdNumber:[B
    .end local v2           #byteTag:[B
    .restart local v3       #footerOffset:I
    :cond_4
    iget-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    invoke-static {v5}, Landroid/telephony/PhoneNumberUtils;->numberToCalledPartyBCD(Ljava/lang/String;)[B

    move-result-object v1

    .line 746
    .restart local v1       #bcdNumber:[B
    add-int/lit8 v5, v3, 0x0

    array-length v6, v1

    int-to-byte v6, v6

    aput-byte v6, v0, v5

    goto :goto_2

    .line 762
    .restart local v2       #byteTag:[B
    :cond_5
    add-int/lit8 v3, v3, -0x1

    goto :goto_3

    .line 764
    :cond_6
    array-length v5, v2

    invoke-static {v2, v8, v0, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto/16 :goto_1

    .line 767
    .end local v2           #byteTag:[B
    :cond_7
    iget-object v5, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-static {v5}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm8BitPacked(Ljava/lang/String;)[B

    move-result-object v2

    .line 768
    .restart local v2       #byteTag:[B
    array-length v5, v2

    invoke-static {v2, v8, v0, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto/16 :goto_1
.end method

.method public buildAdnString(II)[B
    .locals 4
    .parameter "recordSize"
    .parameter "adnExt1Id"

    .prologue
    .line 673
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/AdnRecord;->buildAdnString(I)[B

    move-result-object v0

    .line 674
    .local v0, adnString:[B
    add-int/lit8 v1, p1, -0xe

    .line 676
    .local v1, footerOffset:I
    add-int/lit8 v2, v1, 0xd

    int-to-byte v3, p2

    aput-byte v3, v0, v2

    .line 677
    return-object v0
.end method

.method public buildAnrString(ILjava/lang/String;II)[B
    .locals 6
    .parameter "recordSize"
    .parameter "anr"
    .parameter "anrExt1Id"
    .parameter "adnIndex"

    .prologue
    const/4 v5, 0x0

    .line 688
    new-array v0, p1, [B

    .line 689
    .local v0, anrString:[B
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, p1, :cond_0

    .line 690
    const/4 v3, -0x1

    aput-byte v3, v0, v2

    .line 689
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 692
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 704
    :cond_1
    :goto_1
    return-object v0

    .line 695
    :cond_2
    invoke-static {p2}, Landroid/telephony/PhoneNumberUtils;->numberToCalledPartyBCD(Ljava/lang/String;)[B

    move-result-object v1

    .line 697
    .local v1, bcdAnr:[B
    const/4 v3, 0x2

    array-length v4, v1

    invoke-static {v1, v5, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 699
    aput-byte v5, v0, v5

    .line 700
    const/4 v3, 0x1

    array-length v4, v1

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 701
    const/16 v3, 0x11

    if-lt p1, v3, :cond_1

    .line 702
    const/16 v3, 0x10

    int-to-byte v4, p4

    aput-byte v4, v0, v3

    goto :goto_1
.end method

.method public buildAnrString(ILjava/lang/String;III)[B
    .locals 3
    .parameter "recordSize"
    .parameter "anr"
    .parameter "anrExt1Id"
    .parameter "adnIndex"
    .parameter "extRecordAnr0"

    .prologue
    .line 682
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/AdnRecord;->buildAnrString(ILjava/lang/String;II)[B

    move-result-object v0

    .line 683
    .local v0, anrString:[B
    const/16 v1, 0xe

    and-int/lit16 v2, p5, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 684
    return-object v0
.end method

.method public buildSneOrGsdString(ILjava/lang/String;)[B
    .locals 6
    .parameter "recordSize"
    .parameter "str"

    .prologue
    const/4 v5, 0x0

    .line 779
    new-array v2, p1, [B

    .line 780
    .local v2, retString:[B
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, p1, :cond_0

    .line 781
    const/4 v3, -0x1

    aput-byte v3, v2, v1

    .line 780
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 783
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 784
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    if-eq v3, v4, :cond_4

    .line 785
    invoke-direct {p0, p2}, Lcom/android/internal/telephony/AdnRecord;->gbEncoding(Ljava/lang/String;)[B

    move-result-object v0

    .line 786
    .local v0, byteStr:[B
    array-length v3, v0

    if-le v3, p1, :cond_3

    .line 787
    rem-int/lit8 v3, p1, 0x2

    const/4 v4, 0x1

    if-ne v3, v4, :cond_2

    .end local p1
    :goto_1
    invoke-static {v0, v5, v2, v5, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 797
    .end local v0           #byteStr:[B
    :cond_1
    :goto_2
    return-object v2

    .line 787
    .restart local v0       #byteStr:[B
    .restart local p1
    :cond_2
    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    .line 790
    :cond_3
    array-length v3, v0

    invoke-static {v0, v5, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2

    .line 793
    .end local v0           #byteStr:[B
    :cond_4
    iget-object v3, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-static {v3}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm8BitPacked(Ljava/lang/String;)[B

    move-result-object v0

    .line 794
    .restart local v0       #byteStr:[B
    array-length v3, v0

    invoke-static {v0, v5, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 648
    const/4 v0, 0x0

    return v0
.end method

.method public getAlphaTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    return-object v0
.end method

.method public getAnrEfids()[I
    .locals 1

    .prologue
    .line 358
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    return-object v0
.end method

.method public getAnrs()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 346
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    return-object v0
.end method

.method public getEmailEfids()[I
    .locals 1

    .prologue
    .line 354
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    return-object v0
.end method

.method public getEmails()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 342
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    return-object v0
.end method

.method public getExtRecordAnr0()I
    .locals 1

    .prologue
    .line 374
    iget v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    return v0
.end method

.method public getGrpEfid()I
    .locals 1

    .prologue
    .line 370
    iget v0, p0, Lcom/android/internal/telephony/AdnRecord;->grpEfid:I

    return v0
.end method

.method public getGrps()[B
    .locals 1

    .prologue
    .line 366
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    return-object v0
.end method

.method public getNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 338
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    return-object v0
.end method

.method public getSneEfids()[I
    .locals 1

    .prologue
    .line 362
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->sneEfids:[I

    return-object v0
.end method

.method public getSnes()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 350
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    return-object v0
.end method

.method public hasExtendedRecord()Z
    .locals 2

    .prologue
    .line 499
    iget v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecord:I

    const/16 v1, 0xff

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasExtendedRecordAnr0()Z
    .locals 2

    .prologue
    .line 503
    iget v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    const/16 v1, 0xff

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 493
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/AdnRecord;->isStringArrayEmpty([Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEqual(Lcom/android/internal/telephony/AdnRecord;)Z
    .locals 2
    .parameter "adn"

    .prologue
    .line 636
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/android/internal/telephony/AdnRecord;->stringCompareNullEqualsEmpty(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/android/internal/telephony/AdnRecord;->stringCompareNullEqualsEmpty(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/AdnRecord;->stringArrayMatch([Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/AdnRecord;->stringArrayMatch([Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isStringArrayEmpty([Ljava/lang/String;)Z
    .locals 6
    .parameter "strs"

    .prologue
    const/4 v4, 0x1

    .line 474
    if-eqz p1, :cond_0

    array-length v5, p1

    if-nez v5, :cond_1

    .line 482
    :cond_0
    :goto_0
    return v4

    .line 477
    :cond_1
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 478
    .local v3, s:Ljava/lang/String;
    if-eqz v3, :cond_2

    const-string v5, ""

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 479
    const/4 v4, 0x0

    goto :goto_0

    .line 477
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public isbyteArrayEmpty([B)Z
    .locals 1
    .parameter "bytes"

    .prologue
    .line 486
    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    .line 487
    :cond_0
    const/4 v0, 0x1

    .line 489
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAnrEfids([I)V
    .locals 0
    .parameter "anrEfids"

    .prologue
    .line 393
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    .line 394
    return-void
.end method

.method public setAnrFileTypes([I)V
    .locals 0
    .parameter "anrFileTypes"

    .prologue
    .line 421
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    .line 422
    return-void
.end method

.method public setAnrIndexes([I)V
    .locals 0
    .parameter "anrIndexes"

    .prologue
    .line 405
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->anrIndexes:[I

    .line 406
    return-void
.end method

.method public setAnrs([Ljava/lang/String;)V
    .locals 0
    .parameter "anrs"

    .prologue
    .line 381
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .line 382
    return-void
.end method

.method public setEmailEfids([I)V
    .locals 0
    .parameter "emailEfids"

    .prologue
    .line 389
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    .line 390
    return-void
.end method

.method public setEmailFileTypes([I)V
    .locals 0
    .parameter "emailFileTypes"

    .prologue
    .line 417
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    .line 418
    return-void
.end method

.method public setEmailIndexes([I)V
    .locals 0
    .parameter "emailIndexes"

    .prologue
    .line 401
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    .line 402
    return-void
.end method

.method public setEmails([Ljava/lang/String;)V
    .locals 0
    .parameter "emails"

    .prologue
    .line 377
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .line 378
    return-void
.end method

.method public setExtRecordAnr0(I)V
    .locals 0
    .parameter "extRecordAnr0"

    .prologue
    .line 413
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->extRecordAnr0:I

    .line 414
    return-void
.end method

.method public setGrpEfid(I)V
    .locals 0
    .parameter "grpEfid"

    .prologue
    .line 433
    iput p1, p0, Lcom/android/internal/telephony/AdnRecord;->grpEfid:I

    .line 434
    return-void
.end method

.method public setGrps([B)V
    .locals 0
    .parameter "grps"

    .prologue
    .line 429
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    .line 430
    return-void
.end method

.method public setSneEfids([I)V
    .locals 0
    .parameter "sneEfids"

    .prologue
    .line 397
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->sneEfids:[I

    .line 398
    return-void
.end method

.method public setSneFileTypes([I)V
    .locals 0
    .parameter "sneFileTypes"

    .prologue
    .line 425
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->sneFileTypes:[I

    .line 426
    return-void
.end method

.method public setSneIndexes([I)V
    .locals 0
    .parameter "sneIndexes"

    .prologue
    .line 409
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->sneIndexes:[I

    .line 410
    return-void
.end method

.method public setSnes([Ljava/lang/String;)V
    .locals 0
    .parameter "snes"

    .prologue
    .line 385
    iput-object p1, p0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    .line 386
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 10

    .prologue
    .line 437
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v8, "ADN Record: "

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 438
    .local v6, output:Ljava/lang/StringBuilder;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "alphaTag = ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "],"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 439
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "number = ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "],"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 440
    iget-object v8, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    if-eqz v8, :cond_0

    .line 441
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    .local v1, arr$:[Ljava/lang/String;
    array-length v5, v1

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v2, v1, v4

    .line 442
    .local v2, email:Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "emails = ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "],"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 445
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v2           #email:Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #len$:I
    :cond_0
    const-string v8, "emails is null,"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    :cond_1
    iget-object v8, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    if-eqz v8, :cond_2

    .line 449
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    .restart local v1       #arr$:[Ljava/lang/String;
    array-length v5, v1

    .restart local v5       #len$:I
    const/4 v4, 0x0

    .restart local v4       #i$:I
    :goto_1
    if-ge v4, v5, :cond_3

    aget-object v0, v1, v4

    .line 450
    .local v0, anr:Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "anrs = ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "],"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 453
    .end local v0           #anr:Ljava/lang/String;
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #len$:I
    :cond_2
    const-string v8, "anrs is null,"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    :cond_3
    iget-object v8, p0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    if-eqz v8, :cond_4

    .line 456
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    .restart local v1       #arr$:[Ljava/lang/String;
    array-length v5, v1

    .restart local v5       #len$:I
    const/4 v4, 0x0

    .restart local v4       #i$:I
    :goto_2
    if-ge v4, v5, :cond_5

    aget-object v7, v1, v4

    .line 457
    .local v7, sne:Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "snes = ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "],"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 460
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v7           #sne:Ljava/lang/String;
    :cond_4
    const-string v8, "snes is null,"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 462
    :cond_5
    iget-object v8, p0, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    if-eqz v8, :cond_6

    .line 463
    iget-object v1, p0, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    .local v1, arr$:[B
    array-length v5, v1

    .restart local v5       #len$:I
    const/4 v4, 0x0

    .restart local v4       #i$:I
    :goto_3
    if-ge v4, v5, :cond_7

    aget-byte v3, v1, v4

    .line 464
    .local v3, grp:B
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "grps = ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "],"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 463
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 467
    .end local v1           #arr$:[B
    .end local v3           #grp:B
    .end local v4           #i$:I
    .end local v5           #len$:I
    :cond_6
    const-string v8, "grps is null,"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 470
    :cond_7
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .parameter "dest"
    .parameter "flags"

    .prologue
    .line 652
    iget v0, p0, Lcom/android/internal/telephony/AdnRecord;->efid:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 653
    iget v0, p0, Lcom/android/internal/telephony/AdnRecord;->recordNumber:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 654
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->alphaTag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 655
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->number:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 656
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->emails:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 657
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->emailEfids:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 658
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->emailIndexes:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 659
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->emailFileTypes:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 660
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->anrs:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 661
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->anrEfids:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 662
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->anrIndexes:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 663
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->anrFileTypes:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 664
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->snes:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 665
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->sneEfids:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 666
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->sneIndexes:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 667
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->sneFileTypes:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 668
    iget-object v0, p0, Lcom/android/internal/telephony/AdnRecord;->grps:[B

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByteArray([B)V

    .line 669
    iget v0, p0, Lcom/android/internal/telephony/AdnRecord;->grpEfid:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 670
    return-void
.end method
