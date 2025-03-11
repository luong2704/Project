; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [162 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [486 x i64] [
	i64 u0x0071cf2d27b7d61e, ; 0: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 84
	i64 u0x02123411c4e01926, ; 1: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 80
	i64 u0x02abedc11addc1ed, ; 2: lib_Mono.Android.Runtime.dll.so => 160
	i64 u0x032267b2a94db371, ; 3: lib_Xamarin.AndroidX.AppCompat.dll.so => 62
	i64 u0x043032f1d071fae0, ; 4: ru/Microsoft.Maui.Controls.resources => 24
	i64 u0x044440a55165631e, ; 5: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 2
	i64 u0x046eb1581a80c6b0, ; 6: vi/Microsoft.Maui.Controls.resources => 30
	i64 u0x0517ef04e06e9f76, ; 7: System.Net.Primitives => 120
	i64 u0x0565d18c6da3de38, ; 8: Xamarin.AndroidX.RecyclerView => 82
	i64 u0x0581db89237110e9, ; 9: lib_System.Collections.dll.so => 96
	i64 u0x05989cb940b225a9, ; 10: Microsoft.Maui.dll => 56
	i64 u0x06076b5d2b581f08, ; 11: zh-HK/Microsoft.Maui.Controls.resources => 31
	i64 u0x06388ffe9f6c161a, ; 12: System.Xml.Linq.dll => 152
	i64 u0x0680a433c781bb3d, ; 13: Xamarin.AndroidX.Collection.Jvm => 66
	i64 u0x07469f2eecce9e85, ; 14: mscorlib.dll => 156
	i64 u0x07c57877c7ba78ad, ; 15: ru/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0x07dcdc7460a0c5e4, ; 16: System.Collections.NonGeneric => 94
	i64 u0x08881a0a9768df86, ; 17: lib_Azure.Core.dll.so => 35
	i64 u0x08f3c9788ee2153c, ; 18: Xamarin.AndroidX.DrawerLayout => 71
	i64 u0x0919c28b89381a0b, ; 19: lib_Microsoft.Extensions.Options.dll.so => 43
	i64 u0x092266563089ae3e, ; 20: lib_System.Collections.NonGeneric.dll.so => 94
	i64 u0x095cacaf6b6a32e4, ; 21: System.Memory.Data => 60
	i64 u0x09b574aaed8045a8, ; 22: lib_Microsoft.Graph.dll.so => 45
	i64 u0x09d144a7e214d457, ; 23: System.Security.Cryptography => 140
	i64 u0x0abb3e2b271edc45, ; 24: System.Threading.Channels.dll => 147
	i64 u0x0b3b632c3bbee20c, ; 25: sk/Microsoft.Maui.Controls.resources => 25
	i64 u0x0b6aff547b84fbe9, ; 26: Xamarin.KotlinX.Serialization.Core.Jvm => 90
	i64 u0x0be2e1f8ce4064ed, ; 27: Xamarin.AndroidX.ViewPager => 85
	i64 u0x0c3ca6cc978e2aae, ; 28: pt-BR/Microsoft.Maui.Controls.resources => 21
	i64 u0x0c59ad9fbbd43abe, ; 29: Mono.Android => 161
	i64 u0x0c7790f60165fc06, ; 30: lib_Microsoft.Maui.Essentials.dll.so => 57
	i64 u0x0d13cd7cce4284e4, ; 31: System.Security.SecureString => 141
	i64 u0x0d3b5ab8b2766190, ; 32: lib_Microsoft.Bcl.AsyncInterfaces.dll.so => 36
	i64 u0x0e14e73a54dda68e, ; 33: lib_System.Net.NameResolution.dll.so => 118
	i64 u0x102861e4055f511a, ; 34: Microsoft.Bcl.AsyncInterfaces.dll => 36
	i64 u0x102a31b45304b1da, ; 35: Xamarin.AndroidX.CustomView => 70
	i64 u0x10f6cfcbcf801616, ; 36: System.IO.Compression.Brotli => 110
	i64 u0x1243e226d5fb13cb, ; 37: Notes => 91
	i64 u0x125b7f94acb989db, ; 38: Xamarin.AndroidX.RecyclerView.dll => 82
	i64 u0x126ee4b0de53cbfd, ; 39: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 52
	i64 u0x138567fa954faa55, ; 40: Xamarin.AndroidX.Browser => 64
	i64 u0x13a01de0cbc3f06c, ; 41: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 8
	i64 u0x13f1e5e209e91af4, ; 42: lib_Java.Interop.dll.so => 159
	i64 u0x13f1e880c25d96d1, ; 43: he/Microsoft.Maui.Controls.resources => 9
	i64 u0x143a1f6e62b82b56, ; 44: Microsoft.IdentityModel.Protocols.OpenIdConnect => 52
	i64 u0x143d8ea60a6a4011, ; 45: Microsoft.Extensions.DependencyInjection.Abstractions => 40
	i64 u0x17125c9a85b4929f, ; 46: lib_netstandard.dll.so => 157
	i64 u0x1752c12f1e1fc00c, ; 47: System.Core => 101
	i64 u0x17b56e25558a5d36, ; 48: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 12
	i64 u0x17f9358913beb16a, ; 49: System.Text.Encodings.Web => 144
	i64 u0x18402a709e357f3b, ; 50: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 90
	i64 u0x18f0ce884e87d89a, ; 51: nb/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x19a4c090f14ebb66, ; 52: System.Security.Claims => 138
	i64 u0x1a91866a319e9259, ; 53: lib_System.Collections.Concurrent.dll.so => 93
	i64 u0x1aac34d1917ba5d3, ; 54: lib_System.dll.so => 155
	i64 u0x1aad60783ffa3e5b, ; 55: lib-th-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x1c753b5ff15bce1b, ; 56: Mono.Android.Runtime.dll => 160
	i64 u0x1cd47467799d8250, ; 57: System.Threading.Tasks.dll => 148
	i64 u0x1e3d87657e9659bc, ; 58: Xamarin.AndroidX.Navigation.UI => 81
	i64 u0x1e71143913d56c10, ; 59: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x1ed8fcce5e9b50a0, ; 60: Microsoft.Extensions.Options.dll => 43
	i64 u0x209375905fcc1bad, ; 61: lib_System.IO.Compression.Brotli.dll.so => 110
	i64 u0x2174319c0d835bc9, ; 62: System.Runtime => 137
	i64 u0x220fd4f2e7c48170, ; 63: th/Microsoft.Maui.Controls.resources => 27
	i64 u0x237be844f1f812c7, ; 64: System.Threading.Thread.dll => 149
	i64 u0x2407aef2bbe8fadf, ; 65: System.Console => 100
	i64 u0x240abe014b27e7d3, ; 66: Xamarin.AndroidX.Core.dll => 68
	i64 u0x247619fe4413f8bf, ; 67: System.Runtime.Serialization.Primitives.dll => 135
	i64 u0x252073cc3caa62c2, ; 68: fr/Microsoft.Maui.Controls.resources.dll => 8
	i64 u0x2662c629b96b0b30, ; 69: lib_Xamarin.Kotlin.StdLib.dll.so => 88
	i64 u0x268c1439f13bcc29, ; 70: lib_Microsoft.Extensions.Primitives.dll.so => 44
	i64 u0x26d077d9678fe34f, ; 71: System.IO.dll => 113
	i64 u0x270a44600c921861, ; 72: System.IdentityModel.Tokens.Jwt => 59
	i64 u0x273f3515de5faf0d, ; 73: id/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0x2742545f9094896d, ; 74: hr/Microsoft.Maui.Controls.resources => 11
	i64 u0x27b410442fad6cf1, ; 75: Java.Interop.dll => 159
	i64 u0x27b97e0d52c3034a, ; 76: System.Diagnostics.Debug => 103
	i64 u0x2801845a2c71fbfb, ; 77: System.Net.Primitives.dll => 120
	i64 u0x2a128783efe70ba0, ; 78: uk/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x2a3b095612184159, ; 79: lib_System.Net.NetworkInformation.dll.so => 119
	i64 u0x2a6507a5ffabdf28, ; 80: System.Diagnostics.TraceSource.dll => 105
	i64 u0x2ad156c8e1354139, ; 81: fi/Microsoft.Maui.Controls.resources => 7
	i64 u0x2af298f63581d886, ; 82: System.Text.RegularExpressions.dll => 146
	i64 u0x2af615542f04da50, ; 83: System.IdentityModel.Tokens.Jwt.dll => 59
	i64 u0x2afc1c4f898552ee, ; 84: lib_System.Formats.Asn1.dll.so => 109
	i64 u0x2b148910ed40fbf9, ; 85: zh-Hant/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x2c8bd14bb93a7d82, ; 86: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0x2cd723e9fe623c7c, ; 87: lib_System.Private.Xml.Linq.dll.so => 127
	i64 u0x2d169d318a968379, ; 88: System.Threading.dll => 150
	i64 u0x2d47774b7d993f59, ; 89: sv/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2db915caf23548d2, ; 90: System.Text.Json.dll => 145
	i64 u0x2e6f1f226821322a, ; 91: el/Microsoft.Maui.Controls.resources.dll => 5
	i64 u0x2f2e98e1c89b1aff, ; 92: System.Xml.ReaderWriter => 153
	i64 u0x2f5911d9ba814e4e, ; 93: System.Diagnostics.Tracing => 106
	i64 u0x2f84070a459bc31f, ; 94: lib_System.Xml.dll.so => 154
	i64 u0x309ee9eeec09a71e, ; 95: lib_Xamarin.AndroidX.Fragment.dll.so => 72
	i64 u0x31195fef5d8fb552, ; 96: _Microsoft.Android.Resource.Designer.dll => 34
	i64 u0x32243413e774362a, ; 97: Xamarin.AndroidX.CardView.dll => 65
	i64 u0x3235427f8d12dae1, ; 98: lib_System.Drawing.Primitives.dll.so => 107
	i64 u0x329753a17a517811, ; 99: fr/Microsoft.Maui.Controls.resources => 8
	i64 u0x32aa989ff07a84ff, ; 100: lib_System.Xml.ReaderWriter.dll.so => 153
	i64 u0x33a31443733849fe, ; 101: lib-es-Microsoft.Maui.Controls.resources.dll.so => 6
	i64 u0x341abc357fbb4ebf, ; 102: lib_System.Net.Sockets.dll.so => 123
	i64 u0x3483b4ef6fcfa4da, ; 103: Notes.dll => 91
	i64 u0x34dfd74fe2afcf37, ; 104: Microsoft.Maui => 56
	i64 u0x34e292762d9615df, ; 105: cs/Microsoft.Maui.Controls.resources.dll => 2
	i64 u0x3508234247f48404, ; 106: Microsoft.Maui.Controls => 54
	i64 u0x3549870798b4cd30, ; 107: lib_Xamarin.AndroidX.ViewPager2.dll.so => 86
	i64 u0x355282fc1c909694, ; 108: Microsoft.Extensions.Configuration => 37
	i64 u0x3673b042508f5b6b, ; 109: lib_System.Runtime.Extensions.dll.so => 129
	i64 u0x37bc29f3183003b6, ; 110: lib_System.IO.dll.so => 113
	i64 u0x385c17636bb6fe6e, ; 111: Xamarin.AndroidX.CustomView.dll => 70
	i64 u0x38869c811d74050e, ; 112: System.Net.NameResolution.dll => 118
	i64 u0x38e93ec1c057cdf6, ; 113: Microsoft.IdentityModel.Protocols => 51
	i64 u0x393c226616977fdb, ; 114: lib_Xamarin.AndroidX.ViewPager.dll.so => 85
	i64 u0x395e37c3334cf82a, ; 115: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 1
	i64 u0x3ae44ac43a1fbdbb, ; 116: System.Runtime.Serialization => 136
	i64 u0x3b860f9932505633, ; 117: lib_System.Text.Encoding.Extensions.dll.so => 142
	i64 u0x3bea9ebe8c027c01, ; 118: lib_Microsoft.IdentityModel.Tokens.dll.so => 53
	i64 u0x3c7c495f58ac5ee9, ; 119: Xamarin.Kotlin.StdLib => 88
	i64 u0x3cd9d281d402eb9b, ; 120: Xamarin.AndroidX.Browser.dll => 64
	i64 u0x3d46f0b995082740, ; 121: System.Xml.Linq => 152
	i64 u0x3d9c2a242b040a50, ; 122: lib_Xamarin.AndroidX.Core.dll.so => 68
	i64 u0x3f8431e8b68f88f6, ; 123: lib_Notes.dll.so => 91
	i64 u0x407a10bb4bf95829, ; 124: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 78
	i64 u0x41833cf766d27d96, ; 125: mscorlib => 156
	i64 u0x41cab042be111c34, ; 126: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 63
	i64 u0x43375950ec7c1b6a, ; 127: netstandard.dll => 157
	i64 u0x434c4e1d9284cdae, ; 128: Mono.Android.dll => 161
	i64 u0x43950f84de7cc79a, ; 129: pl/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x440c274c940f0550, ; 130: Microsoft.Graph.Core => 47
	i64 u0x448bd33429269b19, ; 131: Microsoft.CSharp => 92
	i64 u0x4499fa3c8e494654, ; 132: lib_System.Runtime.Serialization.Primitives.dll.so => 135
	i64 u0x4515080865a951a5, ; 133: Xamarin.Kotlin.StdLib.dll => 88
	i64 u0x458d2df79ac57c1d, ; 134: lib_System.IdentityModel.Tokens.Jwt.dll.so => 59
	i64 u0x45c40276a42e283e, ; 135: System.Diagnostics.TraceSource => 105
	i64 u0x46a4213bc97fe5ae, ; 136: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x47358bd471172e1d, ; 137: lib_System.Xml.Linq.dll.so => 152
	i64 u0x4787a936949fcac2, ; 138: System.Memory.Data.dll => 60
	i64 u0x47daf4e1afbada10, ; 139: pt/Microsoft.Maui.Controls.resources => 22
	i64 u0x49e952f19a4e2022, ; 140: System.ObjectModel => 125
	i64 u0x4a5667b2462a664b, ; 141: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 81
	i64 u0x4b07a0ed0ab33ff4, ; 142: System.Runtime.Extensions.dll => 129
	i64 u0x4b7b6532ded934b7, ; 143: System.Text.Json => 145
	i64 u0x4cc5f15266470798, ; 144: lib_Xamarin.AndroidX.Loader.dll.so => 77
	i64 u0x4cf6f67dc77aacd2, ; 145: System.Net.NetworkInformation.dll => 119
	i64 u0x4d479f968a05e504, ; 146: System.Linq.Expressions.dll => 114
	i64 u0x4d55a010ffc4faff, ; 147: System.Private.Xml => 128
	i64 u0x4d95fccc1f67c7ca, ; 148: System.Runtime.Loader.dll => 132
	i64 u0x4dcf44c3c9b076a2, ; 149: it/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x4dd9247f1d2c3235, ; 150: Xamarin.AndroidX.Loader.dll => 77
	i64 u0x4e32f00cb0937401, ; 151: Mono.Android.Runtime => 160
	i64 u0x4ebd0c4b82c5eefc, ; 152: lib_System.Threading.Channels.dll.so => 147
	i64 u0x4f21ee6ef9eb527e, ; 153: ca/Microsoft.Maui.Controls.resources => 1
	i64 u0x4ffd65baff757598, ; 154: Microsoft.IdentityModel.Tokens => 53
	i64 u0x5037f0be3c28c7a3, ; 155: lib_Microsoft.Maui.Controls.dll.so => 54
	i64 u0x5131bbe80989093f, ; 156: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 75
	i64 u0x51bb8a2afe774e32, ; 157: System.Drawing => 108
	i64 u0x526ce79eb8e90527, ; 158: lib_System.Net.Primitives.dll.so => 120
	i64 u0x52829f00b4467c38, ; 159: lib_System.Data.Common.dll.so => 102
	i64 u0x529ffe06f39ab8db, ; 160: Xamarin.AndroidX.Core => 68
	i64 u0x52ff996554dbf352, ; 161: Microsoft.Maui.Graphics => 58
	i64 u0x535f7e40e8fef8af, ; 162: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x53978aac584c666e, ; 163: lib_System.Security.Cryptography.Cng.dll.so => 139
	i64 u0x53a96d5c86c9e194, ; 164: System.Net.NetworkInformation => 119
	i64 u0x53be1038a61e8d44, ; 165: System.Runtime.InteropServices.RuntimeInformation.dll => 130
	i64 u0x53c3014b9437e684, ; 166: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x5435e6f049e9bc37, ; 167: System.Security.Claims.dll => 138
	i64 u0x54795225dd1587af, ; 168: lib_System.Runtime.dll.so => 137
	i64 u0x556e8b63b660ab8b, ; 169: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 73
	i64 u0x5588627c9a108ec9, ; 170: System.Collections.Specialized => 95
	i64 u0x571c5cfbec5ae8e2, ; 171: System.Private.Uri => 126
	i64 u0x579a06fed6eec900, ; 172: System.Private.CoreLib.dll => 158
	i64 u0x57c542c14049b66d, ; 173: System.Diagnostics.DiagnosticSource => 104
	i64 u0x58601b2dda4a27b9, ; 174: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x58688d9af496b168, ; 175: Microsoft.Extensions.DependencyInjection.dll => 39
	i64 u0x595a356d23e8da9a, ; 176: lib_Microsoft.CSharp.dll.so => 92
	i64 u0x5a70033ca9d003cb, ; 177: lib_System.Memory.Data.dll.so => 60
	i64 u0x5a89a886ae30258d, ; 178: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 67
	i64 u0x5a8f6699f4a1caa9, ; 179: lib_System.Threading.dll.so => 150
	i64 u0x5ae9cd33b15841bf, ; 180: System.ComponentModel => 99
	i64 u0x5b5f0e240a06a2a2, ; 181: da/Microsoft.Maui.Controls.resources.dll => 3
	i64 u0x5c393624b8176517, ; 182: lib_Microsoft.Extensions.Logging.dll.so => 41
	i64 u0x5d5caf2d8be953e8, ; 183: Microsoft.Graph => 45
	i64 u0x5db0cbbd1028510e, ; 184: lib_System.Runtime.InteropServices.dll.so => 131
	i64 u0x5db30905d3e5013b, ; 185: Xamarin.AndroidX.Collection.Jvm.dll => 66
	i64 u0x5e467bc8f09ad026, ; 186: System.Collections.Specialized.dll => 95
	i64 u0x5ea92fdb19ec8c4c, ; 187: System.Text.Encodings.Web.dll => 144
	i64 u0x5eb8046dd40e9ac3, ; 188: System.ComponentModel.Primitives => 97
	i64 u0x5f36ccf5c6a57e24, ; 189: System.Xml.ReaderWriter.dll => 153
	i64 u0x5f4294b9b63cb842, ; 190: System.Data.Common => 102
	i64 u0x5f9a2d823f664957, ; 191: lib-el-Microsoft.Maui.Controls.resources.dll.so => 5
	i64 u0x609f4b7b63d802d4, ; 192: lib_Microsoft.Extensions.DependencyInjection.dll.so => 39
	i64 u0x60cd4e33d7e60134, ; 193: Xamarin.KotlinX.Coroutines.Core.Jvm => 89
	i64 u0x60f62d786afcf130, ; 194: System.Memory => 116
	i64 u0x61bb78c89f867353, ; 195: System.IO => 113
	i64 u0x61be8d1299194243, ; 196: Microsoft.Maui.Controls.Xaml => 55
	i64 u0x61d2cba29557038f, ; 197: de/Microsoft.Maui.Controls.resources => 4
	i64 u0x61d88f399afb2f45, ; 198: lib_System.Runtime.Loader.dll.so => 132
	i64 u0x622eef6f9e59068d, ; 199: System.Private.CoreLib => 158
	i64 u0x6400f68068c1e9f1, ; 200: Xamarin.Google.Android.Material.dll => 87
	i64 u0x65ecac39144dd3cc, ; 201: Microsoft.Maui.Controls.dll => 54
	i64 u0x65ece51227bfa724, ; 202: lib_System.Runtime.Numerics.dll.so => 133
	i64 u0x6692e924eade1b29, ; 203: lib_System.Console.dll.so => 100
	i64 u0x66a4e5c6a3fb0bae, ; 204: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 75
	i64 u0x66d13304ce1a3efa, ; 205: Xamarin.AndroidX.CursorAdapter => 69
	i64 u0x68558ec653afa616, ; 206: lib-da-Microsoft.Maui.Controls.resources.dll.so => 3
	i64 u0x6872ec7a2e36b1ac, ; 207: System.Drawing.Primitives.dll => 107
	i64 u0x68fbbbe2eb455198, ; 208: System.Formats.Asn1 => 109
	i64 u0x69063fc0ba8e6bdd, ; 209: he/Microsoft.Maui.Controls.resources.dll => 9
	i64 u0x6a4d7577b2317255, ; 210: System.Runtime.InteropServices.dll => 131
	i64 u0x6ace3b74b15ee4a4, ; 211: nb/Microsoft.Maui.Controls.resources => 18
	i64 u0x6afcedb171067e2b, ; 212: System.Core.dll => 101
	i64 u0x6d12bfaa99c72b1f, ; 213: lib_Microsoft.Maui.Graphics.dll.so => 58
	i64 u0x6d79993361e10ef2, ; 214: Microsoft.Extensions.Primitives => 44
	i64 u0x6d86d56b84c8eb71, ; 215: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 69
	i64 u0x6d9bea6b3e895cf7, ; 216: Microsoft.Extensions.Primitives.dll => 44
	i64 u0x6e25a02c3833319a, ; 217: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 79
	i64 u0x6e9965ce1095e60a, ; 218: lib_System.Core.dll.so => 101
	i64 u0x6fd2265da78b93a4, ; 219: lib_Microsoft.Maui.dll.so => 56
	i64 u0x6fdfc7de82c33008, ; 220: cs/Microsoft.Maui.Controls.resources => 2
	i64 u0x70e99f48c05cb921, ; 221: tr/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0x70fd3deda22442d2, ; 222: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x71a495ea3761dde8, ; 223: lib-it-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x71ad672adbe48f35, ; 224: System.ComponentModel.Primitives.dll => 97
	i64 u0x72b1fb4109e08d7b, ; 225: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 11
	i64 u0x73a6be34e822f9d1, ; 226: lib_System.Runtime.Serialization.dll.so => 136
	i64 u0x73e4ce94e2eb6ffc, ; 227: lib_System.Memory.dll.so => 116
	i64 u0x755a91767330b3d4, ; 228: lib_Microsoft.Extensions.Configuration.dll.so => 37
	i64 u0x76012e7334db86e5, ; 229: lib_Xamarin.AndroidX.SavedState.dll.so => 83
	i64 u0x76ca07b878f44da0, ; 230: System.Runtime.Numerics.dll => 133
	i64 u0x77f8a4acc2fdc449, ; 231: System.Security.Cryptography.Cng.dll => 139
	i64 u0x780bc73597a503a9, ; 232: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x783606d1e53e7a1a, ; 233: th/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x78a45e51311409b6, ; 234: Xamarin.AndroidX.Fragment.dll => 72
	i64 u0x7adb8da2ac89b647, ; 235: fi/Microsoft.Maui.Controls.resources.dll => 7
	i64 u0x7b2641c52a771341, ; 236: lib_Microsoft.Graph.Core.dll.so => 47
	i64 u0x7b4927e421291c41, ; 237: Microsoft.IdentityModel.JsonWebTokens.dll => 49
	i64 u0x7bef86a4335c4870, ; 238: System.ComponentModel.TypeConverter => 98
	i64 u0x7c0820144cd34d6a, ; 239: sk/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0x7c2a0bd1e0f988fc, ; 240: lib-de-Microsoft.Maui.Controls.resources.dll.so => 4
	i64 u0x7d649b75d580bb42, ; 241: ms/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0x7d8ee2bdc8e3aad1, ; 242: System.Numerics.Vectors => 124
	i64 u0x7dfc3d6d9d8d7b70, ; 243: System.Collections => 96
	i64 u0x7e2e564fa2f76c65, ; 244: lib_System.Diagnostics.Tracing.dll.so => 106
	i64 u0x7e302e110e1e1346, ; 245: lib_System.Security.Claims.dll.so => 138
	i64 u0x7e946809d6008ef2, ; 246: lib_System.ObjectModel.dll.so => 125
	i64 u0x7ecc13347c8fd849, ; 247: lib_System.ComponentModel.dll.so => 99
	i64 u0x7f00ddd9b9ca5a13, ; 248: Xamarin.AndroidX.ViewPager.dll => 85
	i64 u0x7f9351cd44b1273f, ; 249: Microsoft.Extensions.Configuration.Abstractions => 38
	i64 u0x7fae0ef4dc4770fe, ; 250: Microsoft.Identity.Client => 48
	i64 u0x7fbd557c99b3ce6f, ; 251: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 74
	i64 u0x812c069d5cdecc17, ; 252: System.dll => 155
	i64 u0x81ab745f6c0f5ce6, ; 253: zh-Hant/Microsoft.Maui.Controls.resources => 33
	i64 u0x8277f2be6b5ce05f, ; 254: Xamarin.AndroidX.AppCompat => 62
	i64 u0x828f06563b30bc50, ; 255: lib_Xamarin.AndroidX.CardView.dll.so => 65
	i64 u0x82df8f5532a10c59, ; 256: lib_System.Drawing.dll.so => 108
	i64 u0x82f6403342e12049, ; 257: uk/Microsoft.Maui.Controls.resources => 29
	i64 u0x83c14ba66c8e2b8c, ; 258: zh-Hans/Microsoft.Maui.Controls.resources => 32
	i64 u0x86a909228dc7657b, ; 259: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x86b3e00c36b84509, ; 260: Microsoft.Extensions.Configuration.dll => 37
	i64 u0x87c69b87d9283884, ; 261: lib_System.Threading.Thread.dll.so => 149
	i64 u0x87f6569b25707834, ; 262: System.IO.Compression.Brotli.dll => 110
	i64 u0x8842b3a5d2d3fb36, ; 263: Microsoft.Maui.Essentials => 57
	i64 u0x88bda98e0cffb7a9, ; 264: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 89
	i64 u0x8930322c7bd8f768, ; 265: netstandard => 157
	i64 u0x897a606c9e39c75f, ; 266: lib_System.ComponentModel.Primitives.dll.so => 97
	i64 u0x89c5188089ec2cd5, ; 267: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 130
	i64 u0x8ad229ea26432ee2, ; 268: Xamarin.AndroidX.Loader => 77
	i64 u0x8b4ff5d0fdd5faa1, ; 269: lib_System.Diagnostics.DiagnosticSource.dll.so => 104
	i64 u0x8b9ceca7acae3451, ; 270: lib-he-Microsoft.Maui.Controls.resources.dll.so => 9
	i64 u0x8c53ae18581b14f0, ; 271: Azure.Core => 35
	i64 u0x8d0f420977c2c1c7, ; 272: Xamarin.AndroidX.CursorAdapter.dll => 69
	i64 u0x8d7b8ab4b3310ead, ; 273: System.Threading => 150
	i64 u0x8da188285aadfe8e, ; 274: System.Collections.Concurrent => 93
	i64 u0x8e40b785660ff661, ; 275: lib_Microsoft.Graph.Auth.dll.so => 46
	i64 u0x8e937db395a74375, ; 276: lib_Microsoft.Identity.Client.dll.so => 48
	i64 u0x8ed807bfe9858dfc, ; 277: Xamarin.AndroidX.Navigation.Common => 78
	i64 u0x8ee08b8194a30f48, ; 278: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 10
	i64 u0x8ef7601039857a44, ; 279: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8f32c6f611f6ffab, ; 280: pt/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x8f8829d21c8985a4, ; 281: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x90263f8448b8f572, ; 282: lib_System.Diagnostics.TraceSource.dll.so => 105
	i64 u0x903101b46fb73a04, ; 283: _Microsoft.Android.Resource.Designer => 34
	i64 u0x90393bd4865292f3, ; 284: lib_System.IO.Compression.dll.so => 111
	i64 u0x90634f86c5ebe2b5, ; 285: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 75
	i64 u0x907b636704ad79ef, ; 286: lib_Microsoft.Maui.Controls.Xaml.dll.so => 55
	i64 u0x91418dc638b29e68, ; 287: lib_Xamarin.AndroidX.CustomView.dll.so => 70
	i64 u0x9157bd523cd7ed36, ; 288: lib_System.Text.Json.dll.so => 145
	i64 u0x91a74f07b30d37e2, ; 289: System.Linq.dll => 115
	i64 u0x91fa41a87223399f, ; 290: ca/Microsoft.Maui.Controls.resources.dll => 1
	i64 u0x93cfa73ab28d6e35, ; 291: ms/Microsoft.Maui.Controls.resources => 17
	i64 u0x944077d8ca3c6580, ; 292: System.IO.Compression.dll => 111
	i64 u0x948cffedc8ed7960, ; 293: System.Xml => 154
	i64 u0x948d746a7702861f, ; 294: Microsoft.IdentityModel.Logging.dll => 50
	i64 u0x9502fd818eed2359, ; 295: lib_Microsoft.IdentityModel.Protocols.OpenIdConnect.dll.so => 52
	i64 u0x9564283c37ed59a9, ; 296: lib_Microsoft.IdentityModel.Logging.dll.so => 50
	i64 u0x9656a5a4ef359a71, ; 297: Microsoft.Graph.Auth => 46
	i64 u0x967fc325e09bfa8c, ; 298: es/Microsoft.Maui.Controls.resources => 6
	i64 u0x9732d8dbddea3d9a, ; 299: id/Microsoft.Maui.Controls.resources => 13
	i64 u0x978be80e5210d31b, ; 300: Microsoft.Maui.Graphics.dll => 58
	i64 u0x97b8c771ea3e4220, ; 301: System.ComponentModel.dll => 99
	i64 u0x97e144c9d3c6976e, ; 302: System.Collections.Concurrent.dll => 93
	i64 u0x991d510397f92d9d, ; 303: System.Linq.Expressions => 114
	i64 u0x99a00ca5270c6878, ; 304: Xamarin.AndroidX.Navigation.Runtime => 80
	i64 u0x99cdc6d1f2d3a72f, ; 305: ko/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x9a0cc42c6f36dfc9, ; 306: lib_Microsoft.IdentityModel.Protocols.dll.so => 51
	i64 u0x9d5dbcf5a48583fe, ; 307: lib_Xamarin.AndroidX.Activity.dll.so => 61
	i64 u0x9d74dee1a7725f34, ; 308: Microsoft.Extensions.Configuration.Abstractions.dll => 38
	i64 u0x9e4534b6adaf6e84, ; 309: nl/Microsoft.Maui.Controls.resources => 19
	i64 u0x9e4b95dec42769f7, ; 310: System.Diagnostics.Debug.dll => 103
	i64 u0x9eaf1efdf6f7267e, ; 311: Xamarin.AndroidX.Navigation.Common.dll => 78
	i64 u0x9ef542cf1f78c506, ; 312: Xamarin.AndroidX.Lifecycle.LiveData.Core => 74
	i64 u0x9ffbb6b1434ad2df, ; 313: Microsoft.Identity.Client.dll => 48
	i64 u0xa073c238e883b3ab, ; 314: Microsoft.Graph.dll => 45
	i64 u0xa0d8259f4cc284ec, ; 315: lib_System.Security.Cryptography.dll.so => 140
	i64 u0xa1440773ee9d341e, ; 316: Xamarin.Google.Android.Material => 87
	i64 u0xa1b9d7c27f47219f, ; 317: Xamarin.AndroidX.Navigation.UI.dll => 81
	i64 u0xa2572680829d2c7c, ; 318: System.IO.Pipelines.dll => 112
	i64 u0xa308401900e5bed3, ; 319: lib_mscorlib.dll.so => 156
	i64 u0xa46aa1eaa214539b, ; 320: ko/Microsoft.Maui.Controls.resources => 16
	i64 u0xa4edc8f2ceae241a, ; 321: System.Data.Common.dll => 102
	i64 u0xa5494f40f128ce6a, ; 322: System.Runtime.Serialization.Formatters.dll => 134
	i64 u0xa5e599d1e0524750, ; 323: System.Numerics.Vectors.dll => 124
	i64 u0xa5f1ba49b85dd355, ; 324: System.Security.Cryptography.dll => 140
	i64 u0xa67dbee13e1df9ca, ; 325: Xamarin.AndroidX.SavedState.dll => 83
	i64 u0xa68a420042bb9b1f, ; 326: Xamarin.AndroidX.DrawerLayout.dll => 71
	i64 u0xa78ce3745383236a, ; 327: Xamarin.AndroidX.Lifecycle.Common.Jvm => 73
	i64 u0xa7a2f0662ebff901, ; 328: Microsoft.Graph.Auth.dll => 46
	i64 u0xa7c31b56b4dc7b33, ; 329: hu/Microsoft.Maui.Controls.resources => 12
	i64 u0xa8b52f21e0dbe690, ; 330: System.Runtime.Serialization.dll => 136
	i64 u0xa8e6320dd07580ef, ; 331: lib_Microsoft.IdentityModel.JsonWebTokens.dll.so => 49
	i64 u0xaa2219c8e3449ff5, ; 332: Microsoft.Extensions.Logging.Abstractions => 42
	i64 u0xaa443ac34067eeef, ; 333: System.Private.Xml.dll => 128
	i64 u0xaa52de307ef5d1dd, ; 334: System.Net.Http => 117
	i64 u0xaaaf86367285a918, ; 335: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 40
	i64 u0xaaf432d11af52d87, ; 336: Microsoft.Graph.Core.dll => 47
	i64 u0xaaf84bb3f052a265, ; 337: el/Microsoft.Maui.Controls.resources => 5
	i64 u0xab9c1b2687d86b0b, ; 338: lib_System.Linq.Expressions.dll.so => 114
	i64 u0xac2af3fa195a15ce, ; 339: System.Runtime.Numerics => 133
	i64 u0xac5376a2a538dc10, ; 340: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 74
	i64 u0xacd46e002c3ccb97, ; 341: ro/Microsoft.Maui.Controls.resources => 23
	i64 u0xacf42eea7ef9cd12, ; 342: System.Threading.Channels => 147
	i64 u0xad89c07347f1bad6, ; 343: nl/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xadbb53caf78a79d2, ; 344: System.Web.HttpUtility => 151
	i64 u0xadc90ab061a9e6e4, ; 345: System.ComponentModel.TypeConverter.dll => 98
	i64 u0xadf511667bef3595, ; 346: System.Net.Security => 122
	i64 u0xae282bcd03739de7, ; 347: Java.Interop => 159
	i64 u0xae53579c90db1107, ; 348: System.ObjectModel.dll => 125
	i64 u0xafe29f45095518e7, ; 349: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 76
	i64 u0xb05cc42cd94c6d9d, ; 350: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xb0bb43dc52ea59f9, ; 351: System.Diagnostics.Tracing.dll => 106
	i64 u0xb220631954820169, ; 352: System.Text.RegularExpressions => 146
	i64 u0xb2a3f67f3bf29fce, ; 353: da/Microsoft.Maui.Controls.resources => 3
	i64 u0xb3f0a0fcda8d3ebc, ; 354: Xamarin.AndroidX.CardView => 65
	i64 u0xb46be1aa6d4fff93, ; 355: hi/Microsoft.Maui.Controls.resources => 10
	i64 u0xb477491be13109d8, ; 356: ar/Microsoft.Maui.Controls.resources => 0
	i64 u0xb4bd7015ecee9d86, ; 357: System.IO.Pipelines => 112
	i64 u0xb5c38bf497a4cfe2, ; 358: lib_System.Threading.Tasks.dll.so => 148
	i64 u0xb5c7fcdafbc67ee4, ; 359: Microsoft.Extensions.Logging.Abstractions.dll => 42
	i64 u0xb7212c4683a94afe, ; 360: System.Drawing.Primitives => 107
	i64 u0xb7b7753d1f319409, ; 361: sv/Microsoft.Maui.Controls.resources => 26
	i64 u0xb81a2c6e0aee50fe, ; 362: lib_System.Private.CoreLib.dll.so => 158
	i64 u0xb9185c33a1643eed, ; 363: Microsoft.CSharp.dll => 92
	i64 u0xb9f64d3b230def68, ; 364: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0xb9fc3c8a556e3691, ; 365: ja/Microsoft.Maui.Controls.resources => 15
	i64 u0xba48785529705af9, ; 366: System.Collections.dll => 96
	i64 u0xbb65706fde942ce3, ; 367: System.Net.Sockets => 123
	i64 u0xbbd180354b67271a, ; 368: System.Runtime.Serialization.Formatters => 134
	i64 u0xbd0e2c0d55246576, ; 369: System.Net.Http.dll => 117
	i64 u0xbd437a2cdb333d0d, ; 370: Xamarin.AndroidX.ViewPager2 => 86
	i64 u0xbd5d0b88d3d647a5, ; 371: lib_Xamarin.AndroidX.Browser.dll.so => 64
	i64 u0xbee38d4a88835966, ; 372: Xamarin.AndroidX.AppCompat.AppCompatResources => 63
	i64 u0xc040a4ab55817f58, ; 373: ar/Microsoft.Maui.Controls.resources.dll => 0
	i64 u0xc0d928351ab5ca77, ; 374: System.Console.dll => 100
	i64 u0xc12b8b3afa48329c, ; 375: lib_System.Linq.dll.so => 115
	i64 u0xc1ff9ae3cdb6e1e6, ; 376: Xamarin.AndroidX.Activity.dll => 61
	i64 u0xc278de356ad8a9e3, ; 377: Microsoft.IdentityModel.Logging => 50
	i64 u0xc28c50f32f81cc73, ; 378: ja/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0xc2bcfec99f69365e, ; 379: Xamarin.AndroidX.ViewPager2.dll => 86
	i64 u0xc4d3858ed4d08512, ; 380: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 76
	i64 u0xc50fded0ded1418c, ; 381: lib_System.ComponentModel.TypeConverter.dll.so => 98
	i64 u0xc519125d6bc8fb11, ; 382: lib_System.Net.Requests.dll.so => 121
	i64 u0xc5293b19e4dc230e, ; 383: Xamarin.AndroidX.Navigation.Fragment => 79
	i64 u0xc5325b2fcb37446f, ; 384: lib_System.Private.Xml.dll.so => 128
	i64 u0xc5a0f4b95a699af7, ; 385: lib_System.Private.Uri.dll.so => 126
	i64 u0xc7c01e7d7c93a110, ; 386: System.Text.Encoding.Extensions.dll => 142
	i64 u0xc7ce851898a4548e, ; 387: lib_System.Web.HttpUtility.dll.so => 151
	i64 u0xc858a28d9ee5a6c5, ; 388: lib_System.Collections.Specialized.dll.so => 95
	i64 u0xca3a723e7342c5b6, ; 389: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0xca5801070d9fccfb, ; 390: System.Text.Encoding => 143
	i64 u0xcab3493c70141c2d, ; 391: pl/Microsoft.Maui.Controls.resources => 20
	i64 u0xcacfddc9f7c6de76, ; 392: ro/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xcbd4fdd9cef4a294, ; 393: lib__Microsoft.Android.Resource.Designer.dll.so => 34
	i64 u0xcc182c3afdc374d6, ; 394: Microsoft.Bcl.AsyncInterfaces => 36
	i64 u0xcc2876b32ef2794c, ; 395: lib_System.Text.RegularExpressions.dll.so => 146
	i64 u0xcc5c3bb714c4561e, ; 396: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 89
	i64 u0xcc76886e09b88260, ; 397: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 90
	i64 u0xccf25c4b634ccd3a, ; 398: zh-Hans/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xcd10a42808629144, ; 399: System.Net.Requests => 121
	i64 u0xcdd0c48b6937b21c, ; 400: Xamarin.AndroidX.SwipeRefreshLayout => 84
	i64 u0xceb28d385f84f441, ; 401: Azure.Core.dll => 35
	i64 u0xcf23d8093f3ceadf, ; 402: System.Diagnostics.DiagnosticSource.dll => 104
	i64 u0xcf8fc898f98b0d34, ; 403: System.Private.Xml.Linq => 127
	i64 u0xd0fc33d5ae5d4cb8, ; 404: System.Runtime.Extensions => 129
	i64 u0xd1194e1d8a8de83c, ; 405: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 73
	i64 u0xd333d0af9e423810, ; 406: System.Runtime.InteropServices => 131
	i64 u0xd3426d966bb704f5, ; 407: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 63
	i64 u0xd3651b6fc3125825, ; 408: System.Private.Uri.dll => 126
	i64 u0xd373685349b1fe8b, ; 409: Microsoft.Extensions.Logging.dll => 41
	i64 u0xd3e4c8d6a2d5d470, ; 410: it/Microsoft.Maui.Controls.resources => 14
	i64 u0xd4645626dffec99d, ; 411: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 40
	i64 u0xd5507e11a2b2839f, ; 412: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 76
	i64 u0xd6694f8359737e4e, ; 413: Xamarin.AndroidX.SavedState => 83
	i64 u0xd6d21782156bc35b, ; 414: Xamarin.AndroidX.SwipeRefreshLayout.dll => 84
	i64 u0xd72329819cbbbc44, ; 415: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 38
	i64 u0xd753f071e44c2a03, ; 416: lib_System.Security.SecureString.dll.so => 141
	i64 u0xd7b3764ada9d341d, ; 417: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 42
	i64 u0xda1dfa4c534a9251, ; 418: Microsoft.Extensions.DependencyInjection => 39
	i64 u0xdad05a11827959a3, ; 419: System.Collections.NonGeneric.dll => 94
	i64 u0xdb5383ab5865c007, ; 420: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0xdbeda89f832aa805, ; 421: vi/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0xdbf9607a441b4505, ; 422: System.Linq => 115
	i64 u0xdbfc90157a0de9b0, ; 423: lib_System.Text.Encoding.dll.so => 143
	i64 u0xdce2c53525640bf3, ; 424: Microsoft.Extensions.Logging => 41
	i64 u0xdd2b722d78ef5f43, ; 425: System.Runtime.dll => 137
	i64 u0xdd67031857c72f96, ; 426: lib_System.Text.Encodings.Web.dll.so => 144
	i64 u0xdde30e6b77aa6f6c, ; 427: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xde8769ebda7d8647, ; 428: hr/Microsoft.Maui.Controls.resources.dll => 11
	i64 u0xe0142572c095a480, ; 429: Xamarin.AndroidX.AppCompat.dll => 62
	i64 u0xe021eaa401792a05, ; 430: System.Text.Encoding.dll => 143
	i64 u0xe02f89350ec78051, ; 431: Xamarin.AndroidX.CoordinatorLayout.dll => 67
	i64 u0xe192a588d4410686, ; 432: lib_System.IO.Pipelines.dll.so => 112
	i64 u0xe1a08bd3fa539e0d, ; 433: System.Runtime.Loader => 132
	i64 u0xe1a77eb8831f7741, ; 434: System.Security.SecureString.dll => 141
	i64 u0xe1b52f9f816c70ef, ; 435: System.Private.Xml.Linq.dll => 127
	i64 u0xe1ecfdb7fff86067, ; 436: System.Net.Security.dll => 122
	i64 u0xe2420585aeceb728, ; 437: System.Net.Requests.dll => 121
	i64 u0xe29b73bc11392966, ; 438: lib-id-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xe3811d68d4fe8463, ; 439: pt-BR/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0xe494f7ced4ecd10a, ; 440: hu/Microsoft.Maui.Controls.resources.dll => 12
	i64 u0xe4a9b1e40d1e8917, ; 441: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 7
	i64 u0xe4f74a0b5bf9703f, ; 442: System.Runtime.Serialization.Primitives => 135
	i64 u0xe5434e8a119ceb69, ; 443: lib_Mono.Android.dll.so => 161
	i64 u0xe62913cc36bc07ec, ; 444: System.Xml.dll => 154
	i64 u0xe89a2a9ef110899b, ; 445: System.Drawing.dll => 108
	i64 u0xedc4817167106c23, ; 446: System.Net.Sockets.dll => 123
	i64 u0xedc632067fb20ff3, ; 447: System.Memory.dll => 116
	i64 u0xedc8e4ca71a02a8b, ; 448: Xamarin.AndroidX.Navigation.Runtime.dll => 80
	i64 u0xeeb7ebb80150501b, ; 449: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 66
	i64 u0xeefc635595ef57f0, ; 450: System.Security.Cryptography.Cng => 139
	i64 u0xef72742e1bcca27a, ; 451: Microsoft.Maui.Essentials.dll => 57
	i64 u0xefec0b7fdc57ec42, ; 452: Xamarin.AndroidX.Activity => 61
	i64 u0xf00c29406ea45e19, ; 453: es/Microsoft.Maui.Controls.resources.dll => 6
	i64 u0xf09e47b6ae914f6e, ; 454: System.Net.NameResolution => 118
	i64 u0xf0ac2b489fed2e35, ; 455: lib_System.Diagnostics.Debug.dll.so => 103
	i64 u0xf11b621fc87b983f, ; 456: Microsoft.Maui.Controls.Xaml.dll => 55
	i64 u0xf1c4b4005493d871, ; 457: System.Formats.Asn1.dll => 109
	i64 u0xf238bd79489d3a96, ; 458: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0xf37221fda4ef8830, ; 459: lib_Xamarin.Google.Android.Material.dll.so => 87
	i64 u0xf3ddfe05336abf29, ; 460: System => 155
	i64 u0xf4c1dd70a5496a17, ; 461: System.IO.Compression => 111
	i64 u0xf518f63ead11fcd1, ; 462: System.Threading.Tasks => 148
	i64 u0xf5e59d7ac34b50aa, ; 463: Microsoft.IdentityModel.Protocols.dll => 51
	i64 u0xf6077741019d7428, ; 464: Xamarin.AndroidX.CoordinatorLayout => 67
	i64 u0xf61ade9836ad4692, ; 465: Microsoft.IdentityModel.Tokens.dll => 53
	i64 u0xf6c0e7d55a7a4e4f, ; 466: Microsoft.IdentityModel.JsonWebTokens => 49
	i64 u0xf77b20923f07c667, ; 467: de/Microsoft.Maui.Controls.resources.dll => 4
	i64 u0xf7e2cac4c45067b3, ; 468: lib_System.Numerics.Vectors.dll.so => 124
	i64 u0xf7e74930e0e3d214, ; 469: zh-HK/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0xf84773b5c81e3cef, ; 470: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0xf8e045dc345b2ea3, ; 471: lib_Xamarin.AndroidX.RecyclerView.dll.so => 82
	i64 u0xf915dc29808193a1, ; 472: System.Web.HttpUtility.dll => 151
	i64 u0xf96c777a2a0686f4, ; 473: hi/Microsoft.Maui.Controls.resources.dll => 10
	i64 u0xf9eec5bb3a6aedc6, ; 474: Microsoft.Extensions.Options => 43
	i64 u0xfa3f278f288b0e84, ; 475: lib_System.Net.Security.dll.so => 122
	i64 u0xfa5ed7226d978949, ; 476: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 0
	i64 u0xfa645d91e9fc4cba, ; 477: System.Threading.Thread => 149
	i64 u0xfbf0a31c9fc34bc4, ; 478: lib_System.Net.Http.dll.so => 117
	i64 u0xfc6b7527cc280b3f, ; 479: lib_System.Runtime.Serialization.Formatters.dll.so => 134
	i64 u0xfc719aec26adf9d9, ; 480: Xamarin.AndroidX.Navigation.Fragment.dll => 79
	i64 u0xfd22f00870e40ae0, ; 481: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 71
	i64 u0xfd49b3c1a76e2748, ; 482: System.Runtime.InteropServices.RuntimeInformation => 130
	i64 u0xfd536c702f64dc47, ; 483: System.Text.Encoding.Extensions => 142
	i64 u0xfd583f7657b6a1cb, ; 484: Xamarin.AndroidX.Fragment => 72
	i64 u0xfeae9952cf03b8cb ; 485: tr/Microsoft.Maui.Controls.resources => 28
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [486 x i32] [
	i32 84, i32 80, i32 160, i32 62, i32 24, i32 2, i32 30, i32 120,
	i32 82, i32 96, i32 56, i32 31, i32 152, i32 66, i32 156, i32 24,
	i32 94, i32 35, i32 71, i32 43, i32 94, i32 60, i32 45, i32 140,
	i32 147, i32 25, i32 90, i32 85, i32 21, i32 161, i32 57, i32 141,
	i32 36, i32 118, i32 36, i32 70, i32 110, i32 91, i32 82, i32 52,
	i32 64, i32 8, i32 159, i32 9, i32 52, i32 40, i32 157, i32 101,
	i32 12, i32 144, i32 90, i32 18, i32 138, i32 93, i32 155, i32 27,
	i32 160, i32 148, i32 81, i32 16, i32 43, i32 110, i32 137, i32 27,
	i32 149, i32 100, i32 68, i32 135, i32 8, i32 88, i32 44, i32 113,
	i32 59, i32 13, i32 11, i32 159, i32 103, i32 120, i32 29, i32 119,
	i32 105, i32 7, i32 146, i32 59, i32 109, i32 33, i32 20, i32 127,
	i32 150, i32 26, i32 145, i32 5, i32 153, i32 106, i32 154, i32 72,
	i32 34, i32 65, i32 107, i32 8, i32 153, i32 6, i32 123, i32 91,
	i32 56, i32 2, i32 54, i32 86, i32 37, i32 129, i32 113, i32 70,
	i32 118, i32 51, i32 85, i32 1, i32 136, i32 142, i32 53, i32 88,
	i32 64, i32 152, i32 68, i32 91, i32 78, i32 156, i32 63, i32 157,
	i32 161, i32 20, i32 47, i32 92, i32 135, i32 88, i32 59, i32 105,
	i32 24, i32 152, i32 60, i32 22, i32 125, i32 81, i32 129, i32 145,
	i32 77, i32 119, i32 114, i32 128, i32 132, i32 14, i32 77, i32 160,
	i32 147, i32 1, i32 53, i32 54, i32 75, i32 108, i32 120, i32 102,
	i32 68, i32 58, i32 25, i32 139, i32 119, i32 130, i32 31, i32 138,
	i32 137, i32 73, i32 95, i32 126, i32 158, i32 104, i32 15, i32 39,
	i32 92, i32 60, i32 67, i32 150, i32 99, i32 3, i32 41, i32 45,
	i32 131, i32 66, i32 95, i32 144, i32 97, i32 153, i32 102, i32 5,
	i32 39, i32 89, i32 116, i32 113, i32 55, i32 4, i32 132, i32 158,
	i32 87, i32 54, i32 133, i32 100, i32 75, i32 69, i32 3, i32 107,
	i32 109, i32 9, i32 131, i32 18, i32 101, i32 58, i32 44, i32 69,
	i32 44, i32 79, i32 101, i32 56, i32 2, i32 28, i32 18, i32 14,
	i32 97, i32 11, i32 136, i32 116, i32 37, i32 83, i32 133, i32 139,
	i32 17, i32 27, i32 72, i32 7, i32 47, i32 49, i32 98, i32 25,
	i32 4, i32 17, i32 124, i32 96, i32 106, i32 138, i32 125, i32 99,
	i32 85, i32 38, i32 48, i32 74, i32 155, i32 33, i32 62, i32 65,
	i32 108, i32 29, i32 32, i32 33, i32 37, i32 149, i32 110, i32 57,
	i32 89, i32 157, i32 97, i32 130, i32 77, i32 104, i32 9, i32 35,
	i32 69, i32 150, i32 93, i32 46, i32 48, i32 78, i32 10, i32 23,
	i32 22, i32 21, i32 105, i32 34, i32 111, i32 75, i32 55, i32 70,
	i32 145, i32 115, i32 1, i32 17, i32 111, i32 154, i32 50, i32 52,
	i32 50, i32 46, i32 6, i32 13, i32 58, i32 99, i32 93, i32 114,
	i32 80, i32 16, i32 51, i32 61, i32 38, i32 19, i32 103, i32 78,
	i32 74, i32 48, i32 45, i32 140, i32 87, i32 81, i32 112, i32 156,
	i32 16, i32 102, i32 134, i32 124, i32 140, i32 83, i32 71, i32 73,
	i32 46, i32 12, i32 136, i32 49, i32 42, i32 128, i32 117, i32 40,
	i32 47, i32 5, i32 114, i32 133, i32 74, i32 23, i32 147, i32 19,
	i32 151, i32 98, i32 122, i32 159, i32 125, i32 76, i32 26, i32 106,
	i32 146, i32 3, i32 65, i32 10, i32 0, i32 112, i32 148, i32 42,
	i32 107, i32 26, i32 158, i32 92, i32 22, i32 15, i32 96, i32 123,
	i32 134, i32 117, i32 86, i32 64, i32 63, i32 0, i32 100, i32 115,
	i32 61, i32 50, i32 15, i32 86, i32 76, i32 98, i32 121, i32 79,
	i32 128, i32 126, i32 142, i32 151, i32 95, i32 28, i32 143, i32 20,
	i32 23, i32 34, i32 36, i32 146, i32 89, i32 90, i32 32, i32 121,
	i32 84, i32 35, i32 104, i32 127, i32 129, i32 73, i32 131, i32 63,
	i32 126, i32 41, i32 14, i32 40, i32 76, i32 83, i32 84, i32 38,
	i32 141, i32 42, i32 39, i32 94, i32 30, i32 30, i32 115, i32 143,
	i32 41, i32 137, i32 144, i32 32, i32 11, i32 62, i32 143, i32 67,
	i32 112, i32 132, i32 141, i32 127, i32 122, i32 121, i32 13, i32 21,
	i32 12, i32 7, i32 135, i32 161, i32 154, i32 108, i32 123, i32 116,
	i32 80, i32 66, i32 139, i32 57, i32 61, i32 6, i32 118, i32 103,
	i32 55, i32 109, i32 19, i32 87, i32 155, i32 111, i32 148, i32 51,
	i32 67, i32 53, i32 49, i32 4, i32 124, i32 31, i32 29, i32 82,
	i32 151, i32 10, i32 43, i32 122, i32 0, i32 149, i32 117, i32 134,
	i32 79, i32 71, i32 130, i32 142, i32 72, i32 28
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 278e101698269c9bc8840aa94d72e7f24066a96d"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
