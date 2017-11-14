# megincomp
Sejlcomputer for meginjoller.
Det er planen at den skal bestå af to enheder, en vindsensor til mastetoppen og en hovedenhed med GPS og skærm til jollen.

Vindsensoren skal bestå af 3D-printet hus og mekaniske dele, og en hjemmelavet sensor af 16 Hall-effekt-sensorer og to neodymium-magneter, der i tests har vist sig at give 32 retningspunkter, dvs 11.25 graders opløsning. Det er pt ikke meningen at måle vindstyrken, blot den relative vindretning for at kunne assistere ved kryds og vending. Den vil blive drevet af en low-power 1 MHz attiny85 MCU og kommunikere med hovedenheden gennem en low-power HC-12. Multiplexing af de få pins gøres med to 74HC595 shift registers.
Vindsensorens design består dermed af SCAD filer til de 3D-printede komponenter, SVG filer med design af print, samt Arduino-kode til at drive den.

Hovedenheden skal bestå af en NEO GPS komponent, en eller flere skærme, HC-12 til input fra vindsensoren, og en 160 MHz esp-12e mcu. Et magnetometer med barometer og termometer er stadig under overvejelse.
Det er meningen at den skal angive kurs, hastighed, og fart mod vinden i tilfælde af kryds. Desuden skal den holde styr på tilbagelagt afstand og tid. I fald magnetometeret bliver en realitet, vil den også kunne angive afdrift.
Hovedenheden forventes væsentligst at bestå af breakout boards, og være plavceret i en færdigkøbt vandtæt kasse. Dokumentationen vil således være kredsløbsdiagrammer, komponentliste og kode.
