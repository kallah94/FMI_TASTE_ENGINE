-- This file was generated automatically by OpenGEODE: DO NOT MODIFY IT !

with Interfaces,
     Interfaces.C.Strings,
     Ada.Characters.Handling;

use Interfaces,
    Interfaces.C.Strings,
    Ada.Characters.Handling;


with adaasn1rtl;
use adaasn1rtl;
with Syntax_Error_Datamodel; use Syntax_Error_Datamodel;

with Syntax_Error_RI;
package Syntax_Error with Elaborate_Body is
   
   Default_Context: constant asn1SccSyntax_error_Context :=
      (Init_Done => False,
       others => <>);
   ctxt : aliased asn1SccSyntax_Error_Context := Default_Context;
   procedure Startup with Export, Convention => C, Link_Name => "syntax_error_startup";
   procedure Execute_Transition (Id : Integer);
   CS_Only : constant := 0;
end Syntax_Error;