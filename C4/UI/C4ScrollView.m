// Copyright © 2012 Travis Kirton
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions: The above copyright
// notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

#import "C4ScrollView.h"

@implementation C4ScrollView
@synthesize contentOffset = _contentOffset;

+(C4ScrollView *)scrollView:(CGRect)rect {
    return [[C4ScrollView alloc] initWithFrame:rect];
}

- (id)initWithFrame:(CGRect)frame {
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor clearColor];
    
    self = [super initWithView:scrollView];
    if (self) {
        _UIScrollview = scrollView;
        [_UIScrollview addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(id <UIScrollViewDelegate>)delegate {
    return _UIScrollview.delegate;
}

-(void)setDelegate:(id<UIScrollViewDelegate>)delegate {
    _UIScrollview.delegate = delegate;
}

-(BOOL)isDirectionalLockEnabled {
    return _UIScrollview.directionalLockEnabled;
}

-(void)setDirectionalLockEnabled:(BOOL)directionalLockEnabled {
    _UIScrollview.directionalLockEnabled = directionalLockEnabled;
}

-(BOOL)isPagingEnabled {
    return _UIScrollview.isPagingEnabled;
}

-(void)setPagingEnabled:(BOOL)pagingEnabled {
    _UIScrollview.pagingEnabled = pagingEnabled;
}

-(BOOL)isScrollEnabled {
    return _UIScrollview.isScrollEnabled;
}

-(void)setScrollEnabled:(BOOL)scrollEnabled {
    _UIScrollview.scrollEnabled = scrollEnabled;
}

-(BOOL)alwaysBounceHorizontal {
    return _UIScrollview.alwaysBounceHorizontal;
}

-(void)setAlwaysBounceHorizontal:(BOOL)alwaysBounceHorizontal {
    _UIScrollview.alwaysBounceHorizontal = alwaysBounceHorizontal;
}

-(BOOL)alwaysBounceVertical {
    return _UIScrollview.alwaysBounceVertical;
}

-(void)setAlwaysBounceVertical:(BOOL)alwaysBounceVertical {
    _UIScrollview.alwaysBounceVertical = alwaysBounceVertical;
}

-(BOOL)bounces {
    return _UIScrollview.bounces;
}

-(void)setBounces:(BOOL)bounces {
    _UIScrollview.bounces = bounces;
}

-(CGPoint)contentOffset {
    return _UIScrollview.contentOffset;
}

-(void)setContentOffset:(CGPoint)contentOffset {
    _contentOffset = contentOffset;
    _UIScrollview.contentOffset = contentOffset;
}

-(CGSize)contentSize {
    return _UIScrollview.contentSize;
}

-(void)setContentSize:(CGSize)contentSize {
    _UIScrollview.contentSize = contentSize;
}

-(UIEdgeInsets)contentInset {
    return _UIScrollview.contentInset;
}

-(void)setContentInset:(UIEdgeInsets)contentInset {
    _UIScrollview.contentInset = contentInset;
}

-(void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated {
    [_UIScrollview setContentOffset:contentOffset animated:animated];
}
-(void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated {
    [_UIScrollview scrollRectToVisible:rect animated:animated];
}

- (void)flashScrollIndicators {
    [_UIScrollview flashScrollIndicators];
}

-(BOOL)showsHorizontalScrollIndicator {
    return _UIScrollview.showsHorizontalScrollIndicator;
}

-(void)setShowsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator {
    _UIScrollview.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
}

-(BOOL)showsVerticalScrollIndicator {
    return _UIScrollview.showsVerticalScrollIndicator;
}

-(void)setShowsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator {
    _UIScrollview.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
}

-(UIEdgeInsets)scrollIndicatorInsets {
    return _UIScrollview.scrollIndicatorInsets;
}

-(void)setScrollIndicatorInsets:(UIEdgeInsets)scrollIndicatorInsets {
    _UIScrollview.scrollIndicatorInsets = scrollIndicatorInsets;
}

-(C4ScrollViewIndicatorStyle)indicatorStyle {
    return (C4ScrollViewIndicatorStyle)_UIScrollview.indicatorStyle;
}

-(CGFloat)decelerationRate {
    return _UIScrollview.decelerationRate;
}

-(void)setDecelerationRate:(CGFloat)decelerationRate {
    _UIScrollview.decelerationRate = decelerationRate;
}

-(BOOL)isTracking {
    return _UIScrollview.isTracking;
}

-(BOOL)isDragging {
    return _UIScrollview.isDragging;
}

-(BOOL)isDecelerating {
    return _UIScrollview.isDecelerating;
}

-(BOOL)delaysContentTouches {
    return _UIScrollview.delaysContentTouches;
}

-(void)setDelaysContentTouches:(BOOL)delaysContentTouches {
    _UIScrollview.delaysContentTouches = delaysContentTouches;
}

-(BOOL)canCancelContentTouches {
    return _UIScrollview.canCancelContentTouches;
}

-(void)setCanCancelContentTouches:(BOOL)canCancelContentTouches {
    _UIScrollview.canCancelContentTouches = canCancelContentTouches;
}

-(CGFloat)minimumZoomScale {
    return _UIScrollview.minimumZoomScale;
}

-(void)setMinimumZoomScale:(CGFloat)minimumZoomScale {
    _UIScrollview.minimumZoomScale = minimumZoomScale;
}

-(CGFloat)maximumZoomScale {
    return _UIScrollview.maximumZoomScale;
}

-(void)setMaximumZoomScale:(CGFloat)maximumZoomScale {
    _UIScrollview.maximumZoomScale = maximumZoomScale;
}

-(CGFloat)zoomScale {
    return _UIScrollview.zoomScale;
}

-(void)setZoomScale:(CGFloat)zoomScale {
    _UIScrollview.zoomScale = zoomScale;
}

-(void)setZoomScale:(CGFloat)scale animated:(BOOL)animated {
    [_UIScrollview setZoomScale:scale animated:animated];
}

-(void)zoomToRect:(CGRect)rect animated:(BOOL)animated {
    [_UIScrollview zoomToRect:rect animated:animated];
}

-(BOOL)bouncesZoom {
    return _UIScrollview.bouncesZoom;
}

-(void)setBouncesZoom:(BOOL)bouncesZoom {
    _UIScrollview.bouncesZoom = bouncesZoom;
}

-(BOOL)isZooming {
    return _UIScrollview.isZooming;
}

-(BOOL)isZoomBouncing {
    return _UIScrollview.isZoomBouncing;
}

-(BOOL)scrollsToTop {
    return _UIScrollview.scrollsToTop;
}

-(void)setScrollsToTop:(BOOL)scrollsToTop {
    _UIScrollview.scrollsToTop = scrollsToTop;
}

-(UIPanGestureRecognizer *)panGestureRecognizer {
    return _UIScrollview.panGestureRecognizer;
}

-(UIPinchGestureRecognizer *)pinchGestureRecognizer {
    return _UIScrollview.pinchGestureRecognizer;
}

-(BOOL)touchesShouldCancelInContentView:(UIView *)view {
    return [_UIScrollview touchesShouldCancelInContentView:view];
}

//FIXME: the following is troublesome... looking ahead, i guess if anyone wants to use this method they'll be sufficiently able to code it with a regular UIScrollview

// override points for subclasses to control delivery of touch events to subviews of the scroll view
// called before touches are delivered to a subview of the scroll view. if it returns NO the touches will not be delivered to the subview
// default returns YES
- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view {
    touches = touches;
    event = event;
    view = view;
    return NO;
}

#pragma mark ObserverMethods
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    change = change;
    context = context;
    if([keyPath isEqualToString:@"contentOffset"]) {
        if((UIScrollView *)object == _UIScrollview) {
            [self willChangeValueForKey:@"contentOffset"];
            _contentOffset = _UIScrollview.contentOffset;
            [self didChangeValueForKey:@"contentOffset"];
        }
    }
}

#pragma mark Optional Delegate Methods
//Uncomment any of the following to use them in reaction to things that are going on in the scrollview

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
//}
//
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
//
//}
//
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//
//}
//
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//
//}
//
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
//
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//
//}
//
//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//
//}
//
//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//
//}
//
//- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
//
//}
//
//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
//
//}
//
//- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
//
//}
//
//- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
//
//}

#pragma mark C4AddSubview
-(void)addCamera:(C4Camera *)camera {
    C4Assert([camera isKindOfClass:[C4Camera class]],
             @"You tried to add a %@ using [canvas addShape:]", [camera class]);
    [_UIScrollview addSubview:camera.view];
}

-(void)addShape:(C4Shape *)shape {
    C4Assert([shape isKindOfClass:[C4Shape class]],
             @"You tried to add a %@ using [canvas addShape:]", [shape class]);
    [_UIScrollview addSubview:shape.view];
}

-(void)addSubview:(UIView *)subview {
    C4Assert(![[subview class] isKindOfClass:[C4Camera class]], @"You just tried to add a C4Camera using the addSubview: method, please use addCamera:");
    C4Assert(![[subview class] isKindOfClass:[C4Shape class]], @"You just tried to add a C4Shape using the addSubview: method, please use addShape:");
    C4Assert(![[subview class] isKindOfClass:[C4Movie class]], @"You just tried to add a C4Movie using the addSubview: method, please use addMovie:");
    C4Assert(![[subview class] isKindOfClass:[C4Image class]], @"You just tried to add a C4Image using the addSubview: method, please use addImage:");
    C4Assert(![[subview class] isKindOfClass:[C4GL class]], @"You just tried to add a C4GL using the addSubview: method, please use addGL:");
    C4Assert(![[subview class] isKindOfClass:[C4Label class]], @"You just tried to add a C4Label using the addSubview: method, please use addLabel:");
    [_UIScrollview addSubview:subview];
}

-(void)addLabel:(C4Label *)label {
    C4Assert([label isKindOfClass:[C4Label class]],
             @"You tried to add a %@ using [canvas addLabel:]", [label class]);
    [_UIScrollview addSubview:label.view];
}

-(void)addGL:(C4GL *)gl {
    C4Assert([gl isKindOfClass:[C4GL class]],
             @"You tried to add a %@ using [canvas addGL:]", [gl class]);
    [_UIScrollview addSubview:gl.view];
}

-(void)addImage:(C4Image *)image {
    C4Assert([image isKindOfClass:[C4Image class]],
             @"You tried to add a %@ using [canvas addImage:]", [image class]);
    [_UIScrollview addSubview:image.view];
}

-(void)addMovie:(C4Movie *)movie {
    C4Assert([movie isKindOfClass:[C4Movie class]],
             @"You tried to add a %@ using [canvas addMovie:]", [movie class]);
    [_UIScrollview addSubview:movie.view];
}


#pragma mark Templates

+ (C4Template *)defaultTemplate {
    static C4Template* template;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        template = [C4Template templateForClass:self];
    });
    return template;
}

+ (C4ScrollView *)defaultTemplateProxy {
    return [[self defaultTemplate] proxy];
}

@end
