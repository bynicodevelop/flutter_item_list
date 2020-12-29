#import "FlutterItemListPlugin.h"
#if __has_include(<flutter_item_list/flutter_item_list-Swift.h>)
#import <flutter_item_list/flutter_item_list-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_item_list-Swift.h"
#endif

@implementation FlutterItemListPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterItemListPlugin registerWithRegistrar:registrar];
}
@end
