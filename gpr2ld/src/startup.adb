package body Startup is

   -----------------
   -- Format_Code --
   -----------------

   procedure Format_Code
      (Self : in out Algorithm;
       Subst : Substitution_Value)
   is
      Substitutions : constant Substitution_Array :=
         (1 => Subst);
   begin
      for Line of Self.Code loop
         declare
            Substituted_Code : constant String :=
               Substitute (Str        => To_String (Line),
                           Substrings => Substitutions,
                           Delimiter  => '$');
         begin
            Line := To_Unbounded_String (Substituted_Code);
         end;
      end loop;
   end Format_Code;

   ---------------------------
   -- Format_Code_With_Name --
   ---------------------------

  procedure Format_Code_With_Name
      (Self : in out Algorithm;
       Name : Unbounded_String)
       is
       begin
         Self.Format_Code
            (Subst => (Name  => new String'("NAME"),
                       Value => new String'(To_String (Name))));
       end Format_Code_With_Name;

   -----------------------------
   -- Format_Code_With_Indent --
   -----------------------------

   procedure Format_Code_With_Indent
      (Self : in out Algorithm;
       Indent : Unbounded_String)
       is
       begin
         Self.Format_Code
            (Subst => (Name  => new String'("INDENT"),
                       Value => new String'(To_String (Indent))));
       end Format_Code_With_Indent;

end Startup;