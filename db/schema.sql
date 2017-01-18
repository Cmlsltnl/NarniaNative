-- CREATE TABLE `Users` (
--     `id` INT AUTO_INCREMENT,
--     `post_count` INT NOT NULL,
--     PRIMARY KEY (`id`)
-- );
-- CREATE TABLE `Posts` (
--     `id` INT AUTO_INCREMENT,
--     `post_id` INT NOT NULL,
--     `user_id` INT NOT NULL,
--     `body` VARCHAR(255) NOT NULL,
--     `type` VARCHAR(255) NOT NULL,
--     PRIMARY KEY (`id`)
-- );
-- CREATE TABLE `User_Posts` (
--     `id` INT AUTO_INCREMENT,
--     `user_id` INT NOT NULL,
--     `post_id` INT NOT NULL,
--     PRIMARY KEY (`id`)
-- );
-- CREATE TABLE `Tags` (
--     `id` INT AUTO_INCREMENT,
--     `name` VARCHAR(255) NOT NULL,
--     `parent` INT NOT NULL,
--     PRIMARY KEY (`id`)
-- );
-- CREATE TABLE `Tags_Join` (
--     `tag_id` INT AUTO_INCREMENT,
--     `post_id` INT NOT NULL,
--     `clothing_id` INT NOT NULL
-- );
-- CREATE TABLE `Clothing` (
--     `id` INT AUTO_INCREMENT,
--     `types` VARCHAR(255) NOT NULL,
--     `img` VARCHAR(255) NOT NULL,
--     `tags` INT NOT NULL,
--     PRIMARY KEY (`id`)
-- );
-- ALTER TABLE `Posts` ADD CONSTRAINT `Posts_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);
-- ALTER TABLE `User_Posts` ADD CONSTRAINT `User_Posts_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);
-- ALTER TABLE `User_Posts` ADD CONSTRAINT `User_Posts_fk1` FOREIGN KEY (`post_id`) REFERENCES `Posts`(`id`);
-- ALTER TABLE `Tags` ADD CONSTRAINT `Tags_fk0` FOREIGN KEY (`parent`) REFERENCES `Tags`(`id`);
-- ALTER TABLE `Tags_Join` ADD CONSTRAINT `Tags_Join_fk0` FOREIGN KEY (`tag_id`) REFERENCES `Tags`(`id`);
-- ALTER TABLE `Tags_Join` ADD CONSTRAINT `Tags_Join_fk1` FOREIGN KEY (`post_id`) REFERENCES `Posts`(`id`);
-- ALTER TABLE `Tags_Join` ADD CONSTRAINT `Tags_Join_fk2` FOREIGN KEY (`clothing_id`) REFERENCES `Clothing`(`id`);
-- ALTER TABLE `Clothing` ADD CONSTRAINT `Clothing_fk0` FOREIGN KEY (`tags`) REFERENCES `Tags_Join`(`tag_id`);


DROP DATABASE IF EXISTS `Narnia`;
CREATE DATABASE `Narnia`;
USE `Narnia`;

-- ---
-- Table 'users'
--
-- ---

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INTEGER AUTO_INCREMENT,
  `name` VARCHAR(150) NULL DEFAULT NULL,
  `email` VARCHAR(40) NULL DEFAULT NULL,
  `token` VARCHAR(255) NULL DEFAULT NULL,
  `username` VARCHAR(30) NULL DEFAULT NULL,
  `thumbnail` VARCHAR(255) DEFAULT 'https://www.buira.org/assets/images/shared/default-profile.png',
  `password` VARCHAR(40) NULL DEFAULT NULL,
  `createdAt` VARCHAR(60) NULL DEFAULT NULL,
  `updatedAt` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `clothing`;

CREATE TABLE `clothing` (
  `id` INTEGER AUTO_INCREMENT,
  `detailPageUrl` VARCHAR(500) NULL DEFAULT NULL,
  `smallImg` VARCHAR(500) NULL DEFAULT NULL,
  `mediumImg` VARCHAR(500) NULL DEFAULT NULL,
  `largeImg` VARCHAR(500) NULL DEFAULT NULL,
  `thumbnail` VARCHAR(500) NULL DEFAULT NULL,
  `brand` VARCHAR(100) NULL DEFAULT NULL,
  `color` VARCHAR(50) NULL DEFAULT NULL,
  `department` VARCHAR(50) NULL DEFAULT NULL,
  `listPrice` VARCHAR(30) NULL DEFAULT NULL,
  `productGroup` VARCHAR(100) NULL DEFAULT NULL,
  `productTypeName` VARCHAR(100) NULL DEFAULT NULL,
  `upc` VARCHAR(255) NULL DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `asin` VARCHAR(255) NULL DEFAULT NULL,
  `material` VARCHAR(255) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `position` VARCHAR(255) NULL DEFAULT NULL,
  `tagIds` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` INTEGER AUTO_INCREMENT,
  `postId` INTEGER NULL DEFAULT NULL,
  `userId` INTEGER NOT NULL,
  `likesCount` INTEGER NULL DEFAULT NULL,
  `body` VARCHAR(255) NOT NULL,
  `shirtId` INTEGER NULL DEFAULT NULL,
  `pantId` INTEGER NULL DEFAULT NULL,
  `shoesId` INTEGER NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `type` VARCHAR(255) NOT NULL,
  `createdAt` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `userPosts`;

CREATE TABLE `userPosts` (
  `id` INTEGER AUTO_INCREMENT,
  `userId` INTEGER NOT NULL,
  `postId` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `likesPosts` (
  `id` INTEGER AUTO_INCREMENT,
  `userId` INTEGER NOT NULL,
  `postId` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `userFollowers` (
  `id` INTEGER AUTO_INCREMENT,
  `userId` INTEGER NOT NULL,
  `followerId` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `wardrobe` (
  `id` INTEGER AUTO_INCREMENT,
  `userId` INTEGER NOT NULL,
  `clothingId` INTEGER,
  `list` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`userId`) REFERENCES users(`id`),
  FOREIGN KEY (`clothingId`) REFERENCES clothing(`id`)
);

CREATE TABLE `tags` (
  `id` INTEGER AUTO_INCREMENT,
  `tag` VARCHAR(255) NOT NULL,
  `count` INTEGER NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB;

CREATE TABLE `postTags` (
  `id` INTEGER AUTO_INCREMENT,
  `postId` INTEGER NOT NULL,
  `tagId` INTEGER NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`postId`) REFERENCES posts(`id`),
  FOREIGN KEY (`tagId`) REFERENCES tags(`id`)
);

INSERT INTO `clothing` (detailPageUrl, smallImg, mediumImg, largeImg, brand, color, department, listPrice, productGroup, productTypeName, title, upc, asin, position) VALUES ("https://www.amazon.com/Hanes-Mens-X-Temp-Performance-X-Large/dp/B0132MGK5Q%3Fpsc%3D1%26SubscriptionId%3DAKIAIYV2F3JA5VNKX37A%26tag%3Ddonannarni-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB0132MGK5Q", "https://images-na.ssl-images-amazon.com/images/I/41-qNmknnEL._SL75_.jpg", "https://images-na.ssl-images-amazon.com/images/I/41-qNmknnEL._SL160_.jpg", "https://images-na.ssl-images-amazon.com/images/I/41-qNmknnEL.jpg", "Hanes", "Deep Red", "mens", "$10.00", "Apparel", "SHIRT", "Hanes Men's X-Temp Performance Polo, Deep Red, X-Large", "078715978150", "B0132MGK5Q", "top");
INSERT INTO `clothing` (detailPageUrl, smallImg, mediumImg, largeImg, brand, color, department, listPrice, productGroup, productTypeName, title, upc, asin, position) VALUES ("https://www.amazon.com/Hanes-X-Temp-Performance-Royal-Large/dp/B0132MGJGQ%3Fpsc%3D1%26SubscriptionId%3DAKIAIYV2F3JA5VNKX37A%26tag%3Ddonannarni-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB0132MGJGQ", "https://images-na.ssl-images-amazon.com/images/I/41dr%2BUP1D8L._SL75_.jpg", "https://images-na.ssl-images-amazon.com/images/I/41dr%2BUP1D8L._SL160_.jpg", "https://images-na.ssl-images-amazon.com/images/I/41dr%2BUP1D8L.jpg", "Hanes", "Deep Royal", "mens", "$10.00", "Apparel", "SHIRT", "Hanes Men's X-Temp Performance Polo, Deep Royal, Large", "078715978204", "B0132MGJGQ", "top");
INSERT INTO `clothing` (detailPageUrl, smallImg, mediumImg, largeImg, brand, color, department, listPrice, productGroup, productTypeName, title, upc, asin, position) VALUES ("https://www.amazon.com/Hanes-STEDMAN-Blended-Jersey-XL-Deep/dp/B0009GHM0G%3Fpsc%3D1%26SubscriptionId%3DAKIAIYV2F3JA5VNKX37A%26tag%3Ddonannarni-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB0009GHM0G", "https://images-na.ssl-images-amazon.com/images/I/31nIeEVIJLL._SL75_.jpg", "https://images-na.ssl-images-amazon.com/images/I/31nIeEVIJLL._SL160_.jpg", "https://images-na.ssl-images-amazon.com/images/I/31nIeEVIJLL.jpg", "Hanes", "Deep Forest", "mens", "$7.69", "Apparel", "SHIRT", "Hanes Men's 5.2 oz Hanes STEDMAN Blended Jersey Polo, XL-Deep Forest", "766369121700", "B0009GHM0G", "top");
INSERT INTO `clothing` (detailPageUrl, smallImg, mediumImg, largeImg, brand, color, department, listPrice, productGroup, productTypeName, title, upc, asin, position) VALUES ("https://www.amazon.com/Dickies-Mens-Original-White-36x32/dp/B0001YRCVU%3Fpsc%3D1%26SubscriptionId%3DAKIAIYV2F3JA5VNKX37A%26tag%3Ddonannarni-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB0001YRCVU", "https://images-na.ssl-images-amazon.com/images/I/31Q9W1KC5aL._SL75_.jpg", "https://images-na.ssl-images-amazon.com/images/I/31Q9W1KC5aL._SL160_.jpg", "https://images-na.ssl-images-amazon.com/images/I/31Q9W1KC5aL.jpg", "Dickies", "White", "mens", "$42.00", "Apparel", "PANTS", "Dickies Men's Original 874 Work Pant, White, 36x32", "029311070182", "B0001YRCVU", "mid");
INSERT INTO `clothing` (detailPageUrl, smallImg, mediumImg, largeImg, brand, color, department, listPrice, productGroup, productTypeName, title, upc, asin, position) VALUES ("https://www.amazon.com/Southpole-Active-Basic-Jogger-Fleece/dp/B00M5963BE%3Fpsc%3D1%26SubscriptionId%3DAKIAIYV2F3JA5VNKX37A%26tag%3Ddonannarni-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00M5963BE", "https://images-na.ssl-images-amazon.com/images/I/41dwkR6W%2BHL._SL75_.jpg", "https://images-na.ssl-images-amazon.com/images/I/41dwkR6W%2BHL._SL160_.jpg", "https://images-na.ssl-images-amazon.com/images/I/41dwkR6W%2BHL.jpg", "Southpole", "Brown", "mens", "$12.99", "Apparel", "PANTS", "Southpole Men's Active Basic Jogger Fleece Pants,Brown,Large", "882272786918", "B00M5963BE", "mid");
INSERT INTO `clothing` (detailPageUrl, smallImg, mediumImg, largeImg, brand, color, department, listPrice, productGroup, productTypeName, title, upc, asin, position) VALUES ("https://www.amazon.com/Haggar-Hidden-Expandable-Waist-Plain/dp/B000MXKMG2%3Fpsc%3D1%26SubscriptionId%3DAKIAIYV2F3JA5VNKX37A%26tag%3Ddonannarni-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB000MXKMG2", "https://images-na.ssl-images-amazon.com/images/I/3173PKODPCL._SL75_.jpg", "https://images-na.ssl-images-amazon.com/images/I/3173PKODPCL._SL160_.jpg", "https://images-na.ssl-images-amazon.com/images/I/3173PKODPCL.jpg", "Haggar", "Black", "mens", "$34.99", "Apparel", "PANTS", "Haggar Men's Cool 18 Hidden Expandable Waist Plain Front Pant,Black,36x32", "017457641823", "B000MXKMG2", "mid");
INSERT INTO `clothing` (detailPageUrl, smallImg, mediumImg, largeImg, brand, color, department, listPrice, productGroup, productTypeName, title, upc, asin, position) VALUES ("https://www.amazon.com/adidas-Originals-Superstar-Adicolor-Fashion/dp/B01CDOTBE6%3Fpsc%3D1%26SubscriptionId%3DAKIAIYV2F3JA5VNKX37A%26tag%3Ddonannarni-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB01CDOTBE6", "https://images-na.ssl-images-amazon.com/images/I/41E02Hc%2Bj-L._SL75_.jpg", "https://images-na.ssl-images-amazon.com/images/I/41E02Hc%2Bj-L._SL160_.jpg", "https://images-na.ssl-images-amazon.com/images/I/41E02Hc%2Bj-L.jpg", "adidas", "Scarlet/Scarlet/Scarlet", "mens", "$90.00", "Shoes", "SHOES", "adidas Originals Men's Superstar Adicolor Fashion Sneaker, Scarlet/Scarlet/Scarlet, 10.5 M US", "889138613326", "B01CDOTBE6", "bottom");
INSERT INTO `clothing` (detailPageUrl, smallImg, mediumImg, largeImg, brand, color, department, listPrice, productGroup, productTypeName, title, upc, asin, position) VALUES ("https://www.amazon.com/adidas-Originals-Gazelle-Fashion-Sneaker/dp/B01HLJWS5W%3Fpsc%3D1%26SubscriptionId%3DAKIAIYV2F3JA5VNKX37A%26tag%3Ddonannarni-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB01HLJWS5W", "https://images-na.ssl-images-amazon.com/images/I/414ggcdSoJL._SL75_.jpg", "https://images-na.ssl-images-amazon.com/images/I/414ggcdSoJL._SL160_.jpg", "https://images-na.ssl-images-amazon.com/images/I/414ggcdSoJL.jpg", "adidas", "Green/White/Gold Met.", "mens", "$80.00", "Shoes", "SHOES", "adidas Originals Men's Gazelle Fashion Sneaker, Green/White/Gold Met, 10.5 M US", "889768181806", "B01HLJWS5W", "bottom");
INSERT INTO `clothing` (detailPageUrl, smallImg, mediumImg, largeImg, brand, color, department, listPrice, productGroup, productTypeName, title, upc, asin, position) VALUES ("https://www.amazon.com/adidas-NEO-Baseline-Fashion-Collegiate/dp/B01A1ELRXS%3Fpsc%3D1%26SubscriptionId%3DAKIAIYV2F3JA5VNKX37A%26tag%3Ddonannarni-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB01A1ELRXS", "https://images-na.ssl-images-amazon.com/images/I/41dLJg12AhL._SL75_.jpg", "https://images-na.ssl-images-amazon.com/images/I/41dLJg12AhL._SL160_.jpg", "https://images-na.ssl-images-amazon.com/images/I/41dLJg12AhL.jpg", "adidas NEO", "Collegiate Navy/Tech Grey/White", "mens", "$59.95", "Shoes", "SHOES", "adidas NEO Men's Baseline Fashion Sneaker, Collegiate Navy/Tech Grey/White, 10.5 M US", "889138786556", "B01A1ELRXS", "bottom");

INSERT INTO `users` (name, email, token, username, password, thumbnail) VALUES ("Jonathan", "MrJonWu@gmail.com", "12345678910", "Jon", "password", "https://avatars1.githubusercontent.com/u/21250622?v=3&s=460");
INSERT INTO `users` (name, email, token, username, password, thumbnail) VALUES ("Haris", "haris@haris.com", "12345678910", "Haris", "password", "https://avatars2.githubusercontent.com/u/19330576?v=3&s=460");
INSERT INTO `users` (name, email, token, username, password, thumbnail) VALUES ("Rick", "Rick@rick.com", "12345678910", "Rick", "password", "https://avatars0.githubusercontent.com/u/20013587?v=3&s=460");
INSERT INTO `users` (name, email, token, username, password, thumbnail) VALUES ("Zach", "Zach@zach.com", "12345678910", "Zach", "password", "https://avatars3.githubusercontent.com/u/14946412?v=3&s=460");
INSERT INTO `users` (name, email, token, username, password, thumbnail) VALUES ("Jonathan", "MrJonWu@gmail.com", "12345678910", "Jonathan", "password", "https://s30.postimg.org/spxl38nch/sadpanda.jpg");

INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt, shirtId, pantId, shoesId) VALUES (3, 5, "https://s23.postimg.org/ev70eu6cb/cat_images_funny_picture.jpg", "Check out this awesome outfit I just put together!", "image", "1484454926000", 1, 4, 7);
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt, shirtId, pantId, shoesId) VALUES (1, 8, "https://s30.postimg.org/olxg2hsld/cat_images_funny_pictures_kitties.jpg", "What am I doing with my life?", "image", "1484454927000", 2, 5, 8);
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (2, 3, "https://s30.postimg.org/vvip08hcx/cat_fashion_septem_1773575i_jpg_0.jpg", "I love to dress my cat in pretty clothes.", "image", "1484454928000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (4, 9, "https://s28.postimg.org/i9t0h18r1/cat_fashion_may_1773579i.jpg", "Hi, my name is Zach and this is my cat.", "image", "1484454929000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (3, 5, "https://s-media-cache-ak0.pinimg.com/originals/c8/4e/d1/c84ed12bf5414ef6c7ab228a2f947961.jpg", "Check out this awesome outfit I just put together this morning!", "image", "1484454930000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (1, 8, "https://ae01.alicdn.com/kf/HTB1IK3YHVXXXXcrXFXXq6xXFXXX8/Puppy-Spring-Summer-Cotton-Dogs-Vests-Clothes-White-Side-Black-Square-Dog-Vest-Pet-T-shirt.jpg_640x640.jpg", "Puppy vests? Yes please!", "image", "1484454931000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (2, 3, "https://s29.postimg.org/fqxuf4tvr/Lovely_Letters_Print_Hooded_Pets_Clothing.jpg", "Check this outfit out. It's lit!", "image", "1484454932000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (4, 9, "https://s30.postimg.org/79wqlenrl/dog_wearing_coat_and_hat.jpg", "This is a cute doggy in cute clothes!", "image", "1484454933000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (3, 5, "https://ae01.alicdn.com/kf/HTB100haHVXXXXXKXpXXq6xXFXXX9/Rainbow-cute-girl-pet-dog-clothes-apparel-spring-summer-puppy-dress-clothing-for-dogs-Dog-Supplies.jpg_640x640.jpg", "Check out this awesome outfit I just put together!", "image", "1484454934000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (1, 8, "https://s23.postimg.org/v3jsnaoij/Fashion_cotton_superman_dog_clothes_cute_chihuah.jpg", "This outfit is fantastic!", "image", "1484454935000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (2, 3, "https://s23.postimg.org/4htuoangr/New_Arrival_Lovely_Totoro_and_Lion_Design_Pet_Co.jpg", "Outfit, outfit, outfit, outfit, outfit!!!", "image", "1484454936000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (4, 9, "https://s29.postimg.org/4pdzd22hj/desktop_1420820766.jpg", "Hi, my name is Zach and this is my outfit.", "image", "1484454937000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (3, 5, "https://s23.postimg.org/tw90t5f97/2016_Yellow_Minions_Pet_Dog_Clothes_Cartoon_Dog.jpg", "Check out this awesome outfit I just put together!", "image", "1484454938000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (1, 8, "https://ae01.alicdn.com/kf/HTB1ScHbLFXXXXa1XpXXq6xXFXXX6/Funny-font-b-Pet-b-font-font-b-Cat-b-font-Pirate-font-b-Costume-b.jpg", "This is looking good so far.", "image", "1484454939000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (2, 3, "https://s-media-cache-ak0.pinimg.com/736x/ab/2e/32/ab2e32b0e8c5273372217713fb146165.jpg", "What an amazing outfit!", "image", "1484454940000");
INSERT INTO `posts` (userId, likesCount, body, description, type, createdAt) VALUES (4, 9, "https://s27.postimg.org/yq56tf26r/Honden_Beer_Gedrukt_Pyjama_Jas_Kat_Puppy_Cozy_Kl.jpg", "This outfit is too cute.", "image", UNIX_TIMESTAMP()*1000);

INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (1, 1, "Some people come into our lives and leave footprints on our hearts, while others come into our lives and make us wanna leave footprints on their face.", "comment", "1484454942000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (1, 2, "this is a comment on Rick's post by Haris", "comment", "1484454943000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (1, 4, "I am ready to meet my Maker. Whether my Maker is prepared for the great ordeal of meeting me is another matter.", "comment", "1484454944000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (2, 2, "Sorry, I can't hangout. My uncle's cousin's sister in law's best friend's insurance agent's roommate's pet goldfish died. Maybe next time.", "comment", "1484454945000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (2, 3, "Why go to college? There's Google.", "comment", "1484454946000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (2, 4, "I feel sorry for people who don't drink. When they wake up in the morning, that's as good as they're going to feel all day.", "comment", "1484454947000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (3, 1, "Don't you find it Funny that after Monday(M) and Tuesday(T), the rest of the week says WTF?", "comment", "1484454948000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (3, 3, "Microsoft bought Skype for 8.5 billion!.. what a bunch of idiots! I downloaded it for free!", "comment", "1484454949000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (3, 4, "Life is full of temporary situations, ultimately ending in a permanent solution.", "comment", "1484454950000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (4, 1, "A good lawyer knows the law; a clever one takes the judge to lunch.", "comment", "1484454951000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (4, 2, "After one look at this planet any visitor from outer space would say “I WANT TO SEE THE MANAGER.”", "comment", "1484454952000");
INSERT INTO `posts` (postId, userId, body, type, createdAt) VALUES (4, 3, "The human body was designed by a civil engineer. Who else would run a toxic waste pipeline through a recreational area?", "comment", UNIX_TIMESTAMP()*1000);

INSERT INTO `userFollowers` (userId, followerId) VALUES (1, 2);
INSERT INTO `userFollowers` (userId, followerId) VALUES (1, 3);
-- INSERT INTO `userFollowers` (userId, followerId) VALUES (1, 4);
INSERT INTO `userFollowers` (userId, followerId) VALUES (2, 1);
INSERT INTO `userFollowers` (userId, followerId) VALUES (2, 4);
INSERT INTO `userFollowers` (userId, followerId) VALUES (3, 2);
INSERT INTO `userFollowers` (userId, followerId) VALUES (3, 4);

-- ALTER TABLE `userPosts` ADD FOREIGN KEY (userId) REFERENCES `users` (`id`);
-- ALTER TABLE `userPosts` ADD FOREIGN KEY (postId) REFERENCES `posts` (`id`);
-- ALTER TABLE `posts` ADD FOREIGN KEY (userId) REFERENCES `users` (`id`);
-- select w.*, u.*, c.* from wardrobe w join users u on u.id = w.userId join clothing c on c.id = w.clothingId;