//
//  ViewController.m
//  CollectionView21-10
//
//  Created by Juan Alvarez on 21/10/2019.
//  Copyright © 2019 Juan Alvarez. All rights reserved.
//

#import "ViewController.h"

#import "cell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 8;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    
}


- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
        
        cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"prototipeCell" forIndexPath: indexPath];
        
        [cell.lbPrototype setText:@"prueba"];
        
        [cell.imgPrototype setImage:[UIImage imageNamed:@"Drive"]];
        
        return cell;
        
   
}



@end
