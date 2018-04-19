with GNATCOLL.Projects; use GNATCOLL.Projects;

with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Utils is

   package UString_Vect is new
           Ada.Containers.Vectors (Positive, Unbounded_String);

   procedure Register_Memory_Map_Attributes;

end Utils;
