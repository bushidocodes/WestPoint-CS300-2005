# West Point CS300 Ada (Fall 2005)

A variety of Ada programs that I wrote for West Point's CS300 Computer Science Fundamentals course in Fall 2005.

In 2019, I was going through some of my older files, and I discovered several Microsoft Word documents which contained pasted Ada source code as appendices for assignment submissions. Looking at some of the PowerPoints from course lectures, it appears that I wrote this code while SSHed into a UNIX box from my Windows XP Dell laptop. We had an entire lecture covering the proper use of emacs. 🤣🤣🤣

This repo contains my attempt at cleaning up the code from the MS Word documents to get it into a state that can cleanly compile. I happen to still have "Ada 95: Problem Solving and Program Design. Third Edition," which was the book the course used to teach Ada.

I'm really just working on this code for fun. It's neat to see stuff I wrote nearly 14 years ago.

I plan to clean the code to get it to a point where it compiles cleanly, and then perhaps do some clean code style refactoring to make things easier for folks unfamiliar with Ada to grok. Since this is written against the Ada 95 standard, I may also investigate some refactoring to use features from the newer 2005 and 2012 standards.

---

## Prerequisites

You need a GNAT Ada compiler. The easiest way to get one:

**Windows** — Install [Alire](https://alire.ada.dev/), the Ada package manager, then run:
```
alr toolchain --select gnat_native gprbuild --disable-assistant
```

If Alire's bundled curl has SSL issues (exit code 77), download GNAT manually and extract it:
```powershell
$dest = "$env:LOCALAPPDATA\alire\cache\toolchains"
Invoke-WebRequest -Uri "https://github.com/alire-project/GNAT-FSF-builds/releases/download/gnat-15.2.0-1/gnat-x86_64-windows64-15.2.0-1.tar.gz" -OutFile "$dest\gnat.tar.gz"
tar -xzf "$dest\gnat.tar.gz" -C "$dest"
$env:PATH = "$dest\gnat-x86_64-windows64-15.2.0-1\bin;$env:PATH"
```

**macOS**
```
brew install gnat
```

**Linux (Debian/Ubuntu)**
```
sudo apt install gnat
```

**Linux (Fedora/RHEL)**
```
sudo dnf install gcc-gnat
```

Verify the install:
```
gnat --version
```

---

## Compiling and Running

### Standalone programs

Most programs in the root directory are single-file and compile with `gnatmake`:

```
gnatmake hello.adb
./hello          # Linux/macOS
hello.exe        # Windows
```

`gnatmake` handles compilation and linking in one step. The executable is named after the main procedure (lowercased).

### Multi-file projects

Two programs depend on local packages. `gnatmake` finds them automatically when you compile from the project directory:

**WestPointTrainStation**
```
cd WestPointTrainStation
gnatmake TicketProgram.adb
./ticketprogram
```

**activity_planner** (root directory, depends on `days_enum.ads`/`.adb`)
```
gnatmake activity_planner.adb
./activity_planner
```

**HuntTheWumpus** (needs `Turtle_Graphics` from the parent directory)
```
cd HuntTheWumpus
gnatmake -I../ Wumpus.adb    # Linux/macOS
gnatmake "-I../" Wumpus.adb  # Windows PowerShell
./wumpus
```

---

## Stubbed course libraries

The original course provided two libraries that aren't in the repo. Stubs have been reconstructed from source usage and web research so everything compiles.

### `Min_Max` (`min_max.ads` / `min_max.adb`)

Source: Michael B. Feldman, *Ada 95: Problem Solving and Program Design*, GWU, 1995.  
Provides `Minimum` and `Maximum` functions over `Integer`. The stub is a complete, correct implementation — no graphics or external dependencies involved.

### `Turtle_Graphics` (`turtle_graphics.ads` / `turtle_graphics.adb`)

Source: Tanya Markow, Eugene K. Ressler, Jean R. S. Blair (USMA/West Point).  
"Catch that speeding turtle: latching onto fun graphics in CS1."  
*ACM SIGAda Ada Letters*, Vol. XXVI, Issue 3, pp. 29–34, November 2006.  
<https://doi.org/10.1145/1185875.1185648>

The stub is a **no-op**: `Create_World` prints one diagnostic line, all other drawing calls (`Fly`, `Walk`, `Spot`, `Erase`, `Clear`, `End_World`) do nothing. Programs run and produce their text output without opening a window.

---

## Program Index

### Root directory

| File | Description |
|------|-------------|
| `hello.adb` | Hello World |
| `cm_to_inch.adb` | Converts centimeters to inches |
| `convert_grades.adb` | Numeric score to letter grade via `CASE` |
| `days_enum_demo.adb` | Enumerated type demo — enter a day, get tomorrow and an activity recommendation |
| `activity_planner.adb` | Menu-driven activity planner; depends on `days_enum.ads`/`days_enum.adb` |
| `days_enum.ads` / `days_enum.adb` | `Days_Enum` package used by `activity_planner` |
| `distance_adder.adb` | Unit conversion table (feet, yards, miles, km) |
| `distance_red_blue.adb` | Pythagorean distance between named coordinate pairs |
| `distance_red_blue_2.adb` | Combat simulator with turtle graphics; uses `Turtle_Graphics` stub |
| `file_io_demo.adb` | File I/O with cadet records (GPA, credit hours, graduation year) |
| `find_bundles_each.adb` | Distributes laundry bundles with exception-based input validation |
| `Find_CM_Speed.adb` | Combines cm→inch conversion with speed calculation |
| `find_speed.adb` | Calculates required march speed in miles/hour |
| `for_loops.adb` | Multiple FOR-loop exercises; uses `Min_Max` stub |
| `fuel_estimation.adb` | Estimates fuel consumption across multiple tanks |
| `menu_demo.adb` | GPA calculator with a text menu |
| `min_max.ads` / `min_max.adb` | `Min_Max` stub (Feldman, GWU) — `Minimum` and `Maximum` over integers |
| `nested_loops.adb` | Nested `FOR` loops — lap/mile counter |
| `turtle_graphics.ads` / `turtle_graphics.adb` | `Turtle_Graphics` stub (Markow, Ressler, Blair / West Point) |
| `while_loops.adb` | `WHILE` loop — running distance validation |

### WestPointTrainStation/

Ticket sales system for a train station. See [WestPointTrainStation/README.md](WestPointTrainStation/README.md) for the original assignment spec.

| File | Description |
|------|-------------|
| `TicketProgram.adb` | Main procedure — menu-driven cashier interface |
| `TicketProgramPackage.ads` | Package spec: `View_Total_Sales`, `Check_Tickets`, `Find_Change` |
| `TicketProgramPackage.adb` | Package body |

### HuntTheWumpus/

Incomplete skeleton (several procedures left as stubs by the original assignment). Compiles and runs using the `Turtle_Graphics` stub from the root directory.

| File | Description |
|------|-------------|
| `Wumpus.adb` | Main game procedure |
| `Project2Pack.ads` | Package spec (reconstructed — types and signatures inferred from the body) |
| `Project2Pack.adb` | Package body — world generation and drawing wrappers |

---

## File Structure

```
.
├── hello.adb
├── cm_to_inch.adb
├── convert_grades.adb
├── days_enum_demo.adb           # standalone enum demo (renamed from days_enum.adb)
├── days_enum.ads                # Days_Enum package spec (extracted from activity_planner)
├── days_enum.adb                # Days_Enum package body (extracted from activity_planner)
├── activity_planner.adb
├── distance_adder.adb
├── distance_red_blue.adb
├── distance_red_blue_2.adb
├── file_io_demo.adb
├── find_bundles_each.adb
├── Find_CM_Speed.adb
├── find_speed.adb
├── for_loops.adb
├── fuel_estimation.adb
├── menu_demo.adb
├── min_max.ads                  # stub — Feldman/GWU Min_Max package
├── min_max.adb
├── nested_loops.adb
├── turtle_graphics.ads          # stub — Markow/Ressler/Blair West Point graphics
├── turtle_graphics.adb
├── while_loops.adb
├── HuntTheWumpus/
│   ├── Project2Pack.ads         # reconstructed package spec
│   ├── Project2Pack.adb         # package body
│   └── Wumpus.adb               # main procedure (incomplete skeleton)
└── WestPointTrainStation/
    ├── README.md                # original assignment spec
    ├── TicketProgramPackage.ads # extracted package spec
    ├── TicketProgramPackage.adb # package body
    └── TicketProgram.adb        # main procedure
```
