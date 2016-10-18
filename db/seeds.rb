# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Domain.destroy_all
Record.destroy_all

bulutfon = Domain.create(name: 'bulutfon.net')
superni = Domain.create(name: 'superni.net')


bulutfon.records.create(name: 'bulutfon.net', rtype: 6, content: 'x', ttl: '600', prio: '0')
bulutfon.records.create(name: 'dns1-dnz1.bulutfon.net', rtype: 1, content: '95.173.187.238', ttl: '600', prio: '0')
bulutfon.records.create(name: 'fs3-dnz2.bulutfon.net', rtype: 1, content: '31.192.208.198', ttl: '600', prio: '0')
bulutfon.records.create(name: 'dns1-dnz2.bulutfon.net', rtype: 1, content: '31.192.208.206', ttl: '600', prio: '0')
bulutfon.records.create(name: 'bulutfon.net', rtype: 3, content: 'dns1-dnz1.bulutfon.net', ttl: '600', prio: '0')
superni.records.create(name: '_sip._tcp.bulutfon.net', rtype: 7, content: '10 5060 sip2-v2.bulutfon.net', ttl: '600', prio: '0')
superni.records.create(name: '_sip._udp.bulutfon.net', rtype: 7, content: '10 5060 sip2-v2.bulutfon.net', ttl: '600', prio: '0')
superni.records.create(name: '*.bulutfon.net', rtype: 9, content: '90 50 "s" "SIP+D2T" "" _sip._tcp.bulutfon.net.', ttl: '600', prio: '0')
superni.records.create(name: '*.bulutfon.net', rtype: 9, content: '50 50 "s" "SIP+D2U" "" _sip._udp.bulutfon.net.', ttl: '600', prio: '0')

