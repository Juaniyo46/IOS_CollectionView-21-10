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
    
    return 16;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return CGSizeMake(180, 231);
}


- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
        NSArray *names = [NSArray arrayWithObjects: @"Drive", @"Calendar", @"Classroom", @"Contacts", @"Documentos", @"Formularios", @"Gmail", @"Hangouts", @"Sites", @"Google+", @"Empresas", @"Chat", @"Cálculo",  @"Keep", @"Meet", @"Presentaciones",nil];
        
        cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"prototipeCell" forIndexPath: indexPath];
    
        NSString *nombre = [[NSString alloc] initWithFormat:@"%@",names[indexPath.row]];
        
        [cell.lbPrototype setText:nombre];
    
    NSString *imagen = [[NSString alloc] initWithFormat:@"%@",names[indexPath.row]];
        
        [cell.imgPrototype setImage:[UIImage imageNamed:imagen]];
    
    
        
        return cell;
        
   
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *urls = [NSArray arrayWithObjects:@"https://www.drive.google.com",@"https://www.calendar.google.com", @"https://www.classroom.google.com", @"https://www.contacts.google.com", @"https://www.docs.google.com/document", @"https://www.docs.google.com/forms", @"https://www.mail.google.com", @"https://www.hangouts.google.com", @"https://www.sites.google.com", @"https://plus.google.com/discover", @"https://groups.google.com", @"https://chat.google.com/welcome", @"https://docs.google.com", @"https://keep.google.com", @"https://meet.google.com", @"https://docs.google.com/presentation", nil];
    
    cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"prototipeCell" forIndexPath:indexPath];
    

    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urls[indexPath.row]] options:@{} completionHandler:nil];
    
}



@end
