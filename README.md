# README

## Explanation

* GDNSD supports the following standard RR types with their standard RDATA formats: SOA, A, AAAA, NS, PTR, CNAME, MX, SRV, TXT, and NAPTR.

    Enum values which are in this project for RR types like the following: 

    SOA: 0, A: 1, AAAA: 2, NS: 3, PTR: 4, CNAME: 5, MX: 6, SRV: 7, TXT: 8, NAPTR: 9

* There are two model named Record and Domain. Record table keeps columns named name, rtype, content, ttl.  
  But "MX" RR type keep also prio column. Domain table only keeps the name column.
  
* Following photo shows the relationship between the tables.
 
  ![relationship](docs/image/table_relationship.png)
  
## FAQ

1. How can I change logo?

Logo named logo.png is in the assets/images folder. If you want to change log, you can change image in the assets/image folder.

## How To Use

1. You can see 'config_gdnsd.yml' in config folder. 

     development_path: /your/development/path
        
     production_path: /your/production/path
   
You can define your own way here. 

2. You can use in 'lib/text_file.rb' 

   ```ruby
     def initialize
       @gdnsd = GdnsdIo::FileOperations.new({filepath: APP_CONFIG['development_path']})
     end
    ```
    or
    
    ```ruby
     def initialize
       @gdnsd = GdnsdIo::FileOperations.new({filepath: APP_CONFIG['production_path']})
     end
   ```
    
## Contributing

Once you've made your great commits:

1. Fork Template
2. Create a topic branch - `git checkout -b my_branch`
3. Push to your branch - `git push origin my_branch`
4. Create a Pull Request from your branch
5. That's it!

## Credits

![lab2023](http://lab2023.com/assets/images/named-logo.png)

- GOR(GDNSD on Rails) is maintained and funded by [lab2023 - information technologies](http://lab2023.com/)
- The names and logos for lab2023 are trademarks of lab2023, inc.

## License

Copyright © 2016 [lab2023 - information technologies](http://lab2023.com)