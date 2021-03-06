
-- Copyright (C) 2001 Bill Billowitch.

-- Some of the work to develop this test suite was done with Air Force
-- support.  The Air Force and Bill Billowitch assume no
-- responsibilities for this software.

-- This file is part of VESTs (Vhdl tESTs).

-- VESTs is free software; you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the
-- Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version. 

-- VESTs is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for more details. 

-- You should have received a copy of the GNU General Public License
-- along with VESTs; if not, write to the Free Software Foundation,
-- Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 

-- ---------------------------------------------------------------------
--
-- $Id: tc2886.vhd,v 1.2 2001-10-26 16:30:23 paw Exp $
-- $Revision: 1.2 $
--
-- ---------------------------------------------------------------------

ENTITY ch020101_p00401_01_ent IS
  PORT ( d  : IN  bit;
         q  : OUT bit);
END ch020101_p00401_01_ent;

ARCHITECTURE ch020101_p00401_01_arch OF ch020101_p00401_01_ent IS
  procedure proc1 (signal p1 : inout bit);
  procedure proc2 (signal p1 : buffer bit);

  procedure proc1 (signal p1 : inout bit) is
    variable v1 : bit;
  begin
    v1 := p1;
  end;

  procedure proc2 (signal p1 : buffer bit) is
    variable v1 : bit;
  begin
    v1 := p1;
  end;
BEGIN
  proc1 (d);
  q <= d;

  TESTING: PROCESS
  BEGIN
    assert FALSE
      report "***FAILED TEST: /src/ch02/sc01/sb01/p004/s010101.vhd - Buffer is not an allowed mode for formal parameter of a procedure."
      severity ERROR;
    wait;
  END PROCESS TESTING;

END ch020101_p00401_01_arch;

