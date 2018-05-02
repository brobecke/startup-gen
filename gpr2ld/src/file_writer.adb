-----------------
-- File_Writer --
-----------------

package body File_Writer is

   --------------
   -- Put_Line --
   --------------

   procedure Put_Line
     (Self     : in out Indented_File_Writer;
      Line     :        String;
      Indented :        Boolean := False)
   is
      Indentation : Unbounded_String := To_Unbounded_String ("");
   begin

      if Indented then
         for I in Integer range 1 ..
             Self.Indentation_Level * Self.Indentation_Size
         loop
            Indentation := Indentation & Self.Indentation_Character;
         end loop;
      end if;

      GNATCOLL.VFS.Write
        (Self.Handle, To_String (Indentation) & Line & ASCII.LF);
   end Put_Line;

   --------------
   -- Put_Line --
   --------------

   procedure Put_Line
     (Self     : in out Indented_File_Writer;
      Line     :        Unbounded_String;
      Indented :        Boolean := False)
   is
   begin
      Self.Put_Line (To_String (Line), Indented);
   end Put_Line;

   ------------
   -- Indent --
   ------------

   procedure Indent (Self : in out Indented_File_Writer) is
   begin
      Self.Indentation_Level := Self.Indentation_Level + 1;
   end Indent;

   --------------
   -- Unindent --
   --------------

   procedure Unindent (Self : in out Indented_File_Writer) is
   begin
      Self.Indentation_Level := Self.Indentation_Level - 1;
   end Unindent;

   --------------
   -- New_Line --
   --------------
   procedure New_Line (Self : in out Indented_File_Writer)
   is
   begin
      GNATCOLL.VFS.Write (Self.Handle, "" & ASCII.LF);
   end New_Line;

   ----------
   -- Make --
   ----------

   function Make
     (Handle                : GNATCOLL.VFS.Writable_File;
      Indentation_Size      : Positive  := 2;
      Indentation_Character : Character := ' ')
      return Indented_File_Writer
   is

   begin
      return
        (Handle                => Handle,
         Indentation_Level     => 0,
         Indentation_Size      => Indentation_Size,
         Indentation_Character => Indentation_Character);
   end Make;

   -----------
   -- Close --
   -----------

   procedure Close (Self : in out Indented_File_Writer) is
   begin
      GNATCOLL.VFS.Close (Self.Handle);
   end Close;

end File_Writer;
