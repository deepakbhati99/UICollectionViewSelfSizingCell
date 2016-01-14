//
//  CollectionViewCell.m
//  UICollectionViewSelfSizingCell
//
//  Created by Himanshu Khatri on 1/14/16.
//  Copyright © 2016 bd 001. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    UICollectionViewLayoutAttributes *preferredAttributes=[super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    

    
    return preferredAttributes;
}
- (void)prepareLayout{
    
}
@end
