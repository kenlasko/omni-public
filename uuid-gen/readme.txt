
 --CONTENTS--
 1 - Installation Instructions
 2 - Flash Program Options
 3 - Instructions for CDROM
 4 - Flashing Back to an Older Level of BIOS
 5 - AMIDEEFIx64 - AMIBIOS DMI Editor for Shell
 6 - Flash Customized Logo
 


*****************************************************************************
*                       1. Installation Instructions                        *
*                                                                           *
*     Please print out these instructions or write them down before         *
*     starting this flash update utility.                                   *
*                                                                           *
*     BIOS update by UEFI utility: There is now one compressed folder       *
*     released with each BIOS (image name M1UJTxxUSA.ZIP), containing       *
*     the  BIOS image, Shell flash utility, script files for auto execution,*
*     release note and flash instructions. Unpack and copy all files in     *
*     M1UJTxxUSA.ZIP to the root of USB memory key.                         *
*                                                                                                          *
*     BIOS update by bootable CD: There is now one CD image file            *
*     released with each BIOS (image name M1UJ9xxUSA.ISO), containing the   *
*     BIOS image, UEFI flash utility, release note and flash instructions.  *
*     If you prefer to create a bootable CD to update BIOS, please follow   *
*     the instructions for CDROM.                                           *
*                                                                           *
*****************************************************************************

*****************************************************************************
*                   About Applied Fixes or Features Added                   *
*                                                                           *
*     CHANGES.TXT is a file that lists known problems which are corrected   *
*     and/or features added after applying this update to your system.      *
*     If you like, please take the time to read or print that file before   *
*     using this flash program to update your system BIOS.                  *
*                                                                           *
*****************************************************************************

*****************************************************************************
*                      Basic Installation Instructions                      *
*                                                                           *
*     1.  Please make note of any settings you have changed in the BIOS     *
*         Setup utility. They may have to be re-entered after updating      *
*         the BIOS.                                                         *
*     2.  Please disable Secure Boot options in Security menu and check     *
*         CSM options is disabled in Startup menu before flash BIOS.        *
*     3.  Use the flash update program by putting it in a USB storage       *
*         key, or creating a CD with the ISO image. Power up the            *
*         system and make sure the device with the flash program is         *
*         selected as a boot device.                                        *
*     4.  The current BIOS level on the computer is compared to that of     *
*         the flash update. If the levels are the same, or the level on     *
*         the update is older than the ROM, a message is displayed stating  *
*         "BIOS ROM file is older than (or same as) BIOS ROM image.         *
*         Continue anyway? (y/n)", type in 'y'.                             *
*     5.  Update may take up to 2 minutes. Do not power off or restart the  *
*         system during this procedure!                                     *
*     6.  After the flash update is complete, system will automatically     *
*         reboot. Don't forget to remove the flash device or you may be     *
*         got your BIOS re-updated.                                         *
*     7.  Please enable Secure Boot options again after BIOS upgrade, this  *
*         could protect the security of Windows 10                          *
*                                                                           *
*****************************************************************************


*****************************************************************************
*                          2. Flash Program Options                         *
*                                                                           *
*     The default operation of the flash update program is a step by step   *
*     dialogue with the user that presents choices and gathers responses    *
*     from the user about which choices are desired.                        *
*                                                                           *
*     In some situations (such as a large enterprise with many systems      *
*     that need updating), it may be desirable to create a flash update     *
*     image that requires no manual intervention to perform an update       *
*     operation. This can be done by modifying the script file              *
*     (startup.nsh) calling the flash program with the following            *
*     command:                                                              *
*                                                                           *
*     flash2.efi [option1] [option2] ... [optionX]                          *
*                                                                           *
*     [OPTIONS]                                                             *
*     /h               Show help messages.                                  *
*     /rsmb            Preserve all SMBIOS structures.                      *
*     /clr             Clear BIOS settings.                                 *
*     /ign             Ignore BIOS version check.                           *
*     /sn:nnnnnnn      Update system serial number (up to 20 characters).   *
*     /csn:nnnnnnn     Update chassis serial number (up to 20 characters).  *
*     /mtm:nnnnnnn     Update machine type and model number (up to 25       *
*                      characters).                                         *
*     /tag:nnnnnnn     Update system asset tag (up to 25 characters).       *
*     /uuid            The flash utility will generate an Universally       *
*                      Unique Identifier (UUID), replacing the one that     *
*                      is currently in the system.                          *
*     /reboot          Reboot after all requests done.                      *
*     /pass:nnnnnnn    Input current system password.                       *
*     /quiet           Operating without physical presence.                 *
*                                                                           *
*     The following example shows how to update system asset tag number     *
*     to "1234567" use command line:                                        *
*       flash2.efi /tag:1234567                                             *
*                                                                           *
*     The following example shows how to update bios and update system      *
*     asset tag number by one command:                                      *
*       flash2.efi imageM1U.rom /tag:1234567                                    *
*                                                                           *
*     Note: A flash update image using these program options should be      *
*           tested carefully before widespread usage.                       *
*                                                                           *
*****************************************************************************


*****************************************************************************
*                         3. Instructions for CDROM                         *
*                                                                           *
*     Create a CD with the BIOS package M1UJ9xxUSA.ISO. Power up the        *
*     system and immediately insert the flash CD in the CDROM drive.        *
*     Ensure that you boot from the CDROM.                                  *
*                                                                           *
*     You can modify the serial number and machine type/model if needed.    *
*     Follow the instructions for using the flash update program in the     *
*     basic installation instructions. The utilities mentioned above are    *
*     located in a subdirectory on the CD.                                  *
*                                                                           *
*****************************************************************************


*****************************************************************************
*                 4. Flashing Back to an Older Level of BIOS                *
*                                                                           *
*     In order to flash back to an older level of BIOS, the following       *
*     steps should be used to insure the latest flash utility is used.      *
*                                                                           *
*     1.  Obtain the older level and latest level BIOS update programs      *
*         from the Lenovo website.                                          *
*     2.  Copy imageM1U.rom from the older BIOS update program folder,      *
*         paste it and replace the same file in the latest level BIOS       * 
*         update program folder.                                            *
*     3.  Boot with the latest level update program and follow normal       *
*         procedures.                                                       *
*                                                                           *
*****************************************************************************


*****************************************************************************
*                 5. AMIDEEFIx64 - AMIBIOS DMI Editor for Shell             *
*                                                                           *
*     AMIDEEFIx64.efi [option1] [option2] ... [optionX]                     *
*                                                                           *
*     Options:                                                              *
*     /SP  "String" 	Update the System Machine Type and Model Number.      *
*     /SS  "String" 	Update the System Serial Number.                      *
*     /CS  "String"     Update the Chassis Serial Number.                   *
*     /SU  auto         Update the System UUID.                             *
*     /SV  "String"     update the System Brand ID.                         *
*     /CA  "String"     update the Chassis Asset Tag Number.                *
*                                                                           *
*                                                                           *
*****************************************************************************


*****************************************************************************
*                       6. Flash Customized Logo                            *
*                                                                           *
*     logo.nsh <logo file name>                                             *
*                                                                           *
*     The size of logo file after compression should be less than 8KB       *
*     (the size of compressed logo file is displayed on the screen during   *
*     the processing).                                                      *
*                                                                           *
*     The following example shows how to change the power-on logo.          *
*       logo.nsh myfav.bmp                                                  *
*                                                                           *
*****************************************************************************

