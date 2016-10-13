# README

## Explanation

* GDNSD supports the following standard RR types with their standard RDATA formats: SOA, A, AAAA, NS, PTR, CNAME, MX, SRV, TXT, and NAPTR.

    Enum values which are in this project for RR types like the following: 

    SOA: 0, A: 1, AAAA: 2, NS: 3, PTR: 4, CNAME: 5, MX: 6, SRV: 7, TXT: 8, NAPTR: 9

* There are two model named Record and Domain. Record table keeps columns named name, rtype, content, ttl.  
  But "MX" RR type keep also prio column. Domain table only keeps the name column.
  
* Following photo shows the relationship between the tables.
 
  ![relationship](https://www.dropbox.com/s/xjcs6diirxqriqk/Screenshot%20from%202016-10-13%2013_48_20.png?dl=0)

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