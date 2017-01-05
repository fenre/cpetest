Dette er et samle-repo for enkle tester utført på CPE.
ART. Automatiserte Regresjons-Tester.

fmg_ethernet_mode: 
    Dette scriptet kjøres samtidig med monitor-scriptet på FMG.
    Scriptet som kjører på testmaskin setter ethernet-modus 
     mens monitor-scriptet som kjører på FMG overvåker 
    statusendringer og skriver dette til skjermen.

    Man kan kjøre det i single-modus for å sette en spesifikk modus, 
    eller i full modus for å iterere over samtlige mulige modi.

    Kjør scriptet med "ruby fmg_ethernet_mode single | full "

dhcp_lease:
    Dette enkle scriptet restarter NetworkManager og henter ut siste 
    DHCP Lease Time. Gjør en endring i Prov eller selfcare, og kjør
    så scriptet for å se at forandringen er skjedd.
    