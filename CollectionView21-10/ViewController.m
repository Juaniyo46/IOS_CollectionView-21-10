//
//  ViewController.m
//  CollectionView21-10
//
//  Created by Juan Alvarez on 21/10/2019.
//  Copyright © 2019 Juan Alvarez. All rights reserved.
//

#import "ViewController.h"

#import "cell.h"

#import "customHeader.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    names = [NSArray arrayWithObjects: @"Drive", @"Calendar", @"Classroom", @"Contacts", @"Documentos", @"Formularios", @"Gmail", @"Hangouts", @"Sites", @"Google+", @"Empresas", @"Chat", @"Cálculo",  @"Keep", @"Meet", @"Presentaciones",nil];

   urls = [NSArray arrayWithObjects:@"https://www.drive.google.com",@"https://www.calendar.google.com", @"https://www.classroom.google.com", @"https://www.contacts.google.com", @"https://www.docs.google.com/document", @"https://www.docs.google.com/forms", @"https://www.mail.google.com", @"https://www.hangouts.google.com", @"https://www.sites.google.com", @"https://plus.google.com/discover", @"https://groups.google.com", @"https://chat.google.com/welcome", @"https://docs.google.com", @"https://keep.google.com", @"https://meet.google.com", @"https://docs.google.com/presentation", nil];
    
    nuevosNombres = [[NSMutableArray alloc] init];
    nuevosUrl = [[NSMutableArray alloc] init];
}

- (void)refrescar{
    [self.collectionView reloadData];
}

//refrescar
- (IBAction)btnRefresh:(id)sender {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self refrescar];
    });

}

//ACCION BOTON +
- (IBAction)addBtn:(id)sender {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Añadir elemento" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Insertar" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        //añadir elemento al array
        
        //Capturamos el texto introducido
        NSString *nombre = alert.textFields[0].text;
        NSString *url = alert.textFields[1].text;
        
        //Lo insertamos en el array correspondiente
        
        [self->nuevosNombres addObject:nombre];
        [self->nuevosUrl addObject:url];
        
        //refrescamos
        dispatch_async(dispatch_get_main_queue(), ^{
            [self refrescar];
        });
        
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:nil];
    
    //añadir botones al alert
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    //Añadir input
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * textField){
        //configuración del texfield para titulo
        
        textField.placeholder = @"Título:";
        
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * textField){
        //configuración del texfield para url
        
        textField.placeholder = @"Url:";
        
    }];
    
    //mostrar el alert
    
    [self presentViewController:alert animated:YES completion:nil];
}

//Añadir cabezera con titulo
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    customHeader *header = nil;
 
    if (kind == UICollectionElementKindSectionHeader) {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                        withReuseIdentifier:@"CustomTitle"
                                                      forIndexPath:indexPath];
        if(indexPath.section == 0){
            header.titleLabel.text = @"Título de la sección 1";
        }else{
            header.titleLabel.text = @"Título de la sección 2";
        }
    }
 
    return header;
}


-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0){
        return 16;
    } else {
        return nuevosNombres.count;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return CGSizeMake(180, 231);
}


- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    if (indexPath.section == 0){
        cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"prototipeCell" forIndexPath: indexPath];
        
            NSString *nombre = [[NSString alloc] initWithFormat:@"%@",names[indexPath.row]];
            
            [cell.lbPrototype setText:nombre];
        
        NSString *imagen = [[NSString alloc] initWithFormat:@"%@",names[indexPath.row]];
            
            [cell.imgPrototype setImage:[UIImage imageNamed:imagen]];
        
        
            
            return cell;
    } else {
        cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"prototipeCell" forIndexPath: indexPath];
        
            NSString *nombre = [[NSString alloc] initWithFormat:@"%@",nuevosNombres[indexPath.row]];
            
            [cell.lbPrototype setText:nombre];
        
        NSString *imagen = @"estech";
            
            [cell.imgPrototype setImage:[UIImage imageNamed:imagen]];
        
        
            
            return cell;    }
        
        
   
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"prototipeCell" forIndexPath:indexPath];
    NSString *urlString;
    
    if (indexPath.section == 0){
         urlString = urls[indexPath.row];
    } else {
        urlString = nuevosUrl[indexPath.row];
    }
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];

    
    
}



@end
