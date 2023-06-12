# 정방향 조회 도메인 만들기 
# Add-DnsServerPrimaryZone -Name "sr.local" -ZoneFile "sr.local.dns" 

# 역방향 조회 도메인 만들기 
Add-DnsServerPrimaryZone -NetworkID 10.10.100.0/24 -ZoneFile "10.10.100.in-addr.arpa.dns"

# DNS 포워딩 
# Add-DnsServerForwarder -IPAddress 192.168.3.2 -PassThru

# Domain Controller Record
Add-DnsServerResourceRecordA -Name "sr-vcsa-01" -ZoneName "sr.local" -IPv4Address "10.10.100.10"
Add-DnsServerResourceRecordPtr -Name "10" -ZoneName "100.10.10.in-addr.arpa" -PtrDomainName "sr-vcsa-01.sr.local"

Add-DnsServerResourceRecordA -Name "sr-esxi-01" -ZoneName "sr.local" -IPv4Address "10.10.100.11"
Add-DnsServerResourceRecordPtr -Name "11" -ZoneName "100.10.10.in-addr.arpa" -PtrDomainName "sr-esxi-01.sr.local"

Add-DnsServerResourceRecordA -Name "sr-esxi-02" -ZoneName "sr.local" -IPv4Address "10.10.100.12"
Add-DnsServerResourceRecordPtr -Name "12" -ZoneName "100.10.10.in-addr.arpa" -PtrDomainName "sr-esxi-02.sr.local"

Add-DnsServerResourceRecordA -Name "sr-esxi-03" -ZoneName "sr.local" -IPv4Address "10.10.100.13"
Add-DnsServerResourceRecordPtr -Name "13" -ZoneName "100.10.10.in-addr.arpa" -PtrDomainName "sr-esxi-03.sr.local"
