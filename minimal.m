#import <Cocoa/Cocoa.h>

#define HEIGHT 32

int main () {
  [NSAutoreleasePool new];
  id appName = [[NSProcessInfo processInfo] processName];

  [NSApplication sharedApplication];
/*  [[NSApplication sharedApplication] setPresentationOptions: NSApplicationPresentationAutoHideMenuBar | NSApplicationPresentationHideDock];*/
  [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
  NSRect screen = [[NSScreen mainScreen] frame];
  CGFloat menuBarHeight = 22.0; //[[[NSApplication sharedApplication] mainMenu] menuBarHeight];
  NSLog(@"height: %f\n", menuBarHeight);

  id window = [[[NSWindow alloc]
    initWithContentRect:NSMakeRect(0, 0, screen.size.width, menuBarHeight)
    styleMask:NSBorderlessWindowMask
    backing:NSBackingStoreBuffered defer:YES]
      autorelease];
  NSRect frame = [window frame];
  frame.origin.x = 0;
  frame.origin.y = screen.size.height - menuBarHeight;
  frame.size.width = screen.size.width;
  frame.size.height = menuBarHeight;
  [window setFrame:frame display:YES animate:NO];
  [window setTitle:appName];
  [window setLevel:NSMainMenuWindowLevel + 1];
  [window makeKeyAndOrderFront:nil];
  [NSApp activateIgnoringOtherApps:YES];
  [NSApp run];
  return 0;
}