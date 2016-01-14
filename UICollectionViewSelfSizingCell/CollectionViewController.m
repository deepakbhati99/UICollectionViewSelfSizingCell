//
//  CollectionViewController.m
//  UICollectionViewSelfSizingCell
//
//  Created by Himanshu Khatri on 1/14/16.
//  Copyright © 2016 bd 001. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
@interface CollectionViewController ()
@property (strong,nonatomic)NSMutableArray *objects;

@end
NSUInteger const kNumberOfCells = 200;
NSUInteger const kMinStringLength = 1;
NSUInteger const kMaxStringLength = 10;
@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"collection";
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
        [self.objects removeAllObjects];
        for (int i = 0; i < kNumberOfCells; ++i) {
            [self.objects addObject:[self randomStringWithLength:MAX(kMinStringLength,arc4random_uniform(kMaxStringLength))]];
        }
    }
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.estimatedItemSize = CGSizeMake(20,20);
    layout.minimumInteritemSpacing=1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)insertNewObject:(id)sender {

    
    [self.objects removeAllObjects];
    for (int i = 0; i < kNumberOfCells; ++i) {
        [self.objects addObject:[self randomStringWithLength:MAX(kMinStringLength,arc4random_uniform(kMaxStringLength))]];
    }
    
    [self.collectionView reloadData];
    

    
//    [self.collectionView performBatchUpdates:^{
//        [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
//    }completion:nil];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _objects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell


    cell.labelTitle.text=[_objects[indexPath.item] description];
    
    // Configure the cell
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

NSString *const letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
- (NSString *) randomStringWithLength: (NSUInteger) len {
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (NSUInteger i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((uint32_t)[letters length]) % [letters length]]];
    }
    return randomString;
}

@end
