
library(rvest)
library(polite)
library(dplyr)

# Read the HTML file
computer_url <- "https://www.amazon.com/s?i=specialty-aps&bbn=16225007011&rh=n%3A16225007011%2Cn%3A3011391011&ref=nav_em__nav_desktop_sa_intl_laptop_accessories_0_2_6_7"

session <- bow(computer_url,
               user_agent = "Educational")
session

session_page <- scrape(session)

div_elements <- html_nodes(session_page,'div.sg-col-4-of-24.sg-col-4-of-12.s-result-item.s-asin.sg-col-4-of-16.sg-col.s-widget-spacing-small.sg-col-4-of-20')

computer_bDescriptions<- character()
computer_prices<-character()
computer_reviews<-character()
computer_ratings<-character()

for (div_element in div_elements) {
  
  # Find the span element with class="a-size-base-plus a-color-base a-text-normal" and get the title
  brand_element<- html_node(div_element, 'span.a-size-base-plus.a-color-base.a-text-normal')
  brandDescription <- ifelse(!is.na(brand_element), html_text(brand_element), '')
  
  # Find the span element with class="a-price-whole" and get the price
  price_element <- html_node(div_element, 'span.a-price-whole')
  price <- ifelse(!is.na(price_element), html_text(price_element), '')
  
  # Find the span element with class="a-icon-alt" and get the ratings
  rating_element <- html_node(div_element, 'span.a-icon-alt')
  rating <- ifelse(!is.na(rating_element), html_text(rating_element), '')
  
  review_element <- html_node(div_element, 'div.s-csa-instrumentation-wrapper.alf-search-csa-instrumentation-wrapper')
  review <- ifelse(!is.na(review_element), html_text(review_element), '')
  
  # Append data to vectors
  computer_bDescriptions <- c(computer_bDescriptions,brandDescription)
  computer_prices <- c(computer_prices,price)
  computer_ratings <- c(computer_ratings,rating)
  computer_reviews<-c(computer_reviews,review)
}


# Create a data frame
product_computer <- data.frame(
  Category=c('Accessories'), 
  Brands = computer_bDescriptions, 
  Price = computer_prices, 
  Rating = computer_ratings,
  Review=computer_reviews)


#####
electronics_url<- "https://www.amazon.com/s?i=specialty-aps&bbn=16225009011&rh=n%3A%2116225009011%2Cn%3A1266092011&ref=nav_em__nav_desktop_sa_intl_television_and_video_0_2_5_14"

session1 <- bow(electronics_url,
                user_agent = "Educational")
session1

session_page1 <- scrape(session1)

div_elements <- html_nodes(session_page1,'div.sg-col-4-of-24.sg-col-4-of-12.s-result-item.s-asin.sg-col-4-of-16.sg-col.s-widget-spacing-small.sg-col-4-of-20')

electronics_brandDescriptions<- character()
electronics_prices<-character()
electronics_reviews<-character()
electronics_ratings<-character()

for (div_element in div_elements) {
  
  # Find the span element with class="a-size-base-plus a-color-base a-text-normal" and get the title
  brand_element<- html_node(div_element, 'span.a-size-base-plus.a-color-base.a-text-normal')
  brandDescription <- ifelse(!is.na(brand_element), html_text(brand_element), '')
  
  # Find the span element with class="a-price-whole" and get the price
  price_element <- html_node(div_element, 'span.a-price-whole')
  price <- ifelse(!is.na(price_element), html_text(price_element), '')
  
  # Find the span element with class="a-icon-alt" and get the ratings
  rating_element <- html_node(div_element, 'span.a-icon-alt')
  rating <- ifelse(!is.na(rating_element), html_text(rating_element), '')
  
  review_element <- html_node(div_element, 'div.s-csa-instrumentation-wrapper.alf-search-csa-instrumentation-wrapper')
  review <- ifelse(!is.na(review_element), html_text(review_element), '')
  
  # Append data to vectors
  electronics_brandDescriptions <- c(electronics_brandDescriptions,brandDescription)
  electronics_prices <- c(electronics_prices,price)
  electronics_ratings <- c(electronics_ratings,rating)
  electronics_reviews<-c(electronics_reviews,review)
}


# Create a data frame
electronics_product <- data.frame(
  Category=c('Television'), 
  Brands = electronics_brandDescriptions, 
  Price = electronics_prices, 
  Rating = electronics_ratings,
  Review=electronics_reviews)


Activity1_teves<-rbind(product_computer, electronics_product)
write.csv(Activity1_teves, file = "Activity1_teves.csv")




