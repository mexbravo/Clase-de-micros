################################################################################
# Automatically-generated file. Do not edit!
################################################################################

#Progress monitor hint: 1
first : all
-include ../makefile.init

# This file contains definitions of environment variables used in the makefiles and .args files if exist.
-include makefile.local

RM := "$(GNU_Make_Install_DirEnv)/rm" -f

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include Sources/subdir.mk
-include Project_Settings/Linker_Files/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
OBJS += \
default.lst \
blink_int.obj \

OBJS_QUOTED += \
"default.lst" \
"blink_int.obj" \

OBJS_OS_FORMAT += \
default.lst \
blink_int.obj \

EXECUTABLES += \
blink_int.obj \

EXECUTABLES_QUOTED += \
"blink_int.obj" \

EXECUTABLES_OS_FORMAT += \
blink_int.obj \

BURNER_OUTPUT_OUTPUTS += \
blink_int.obj.s19 \

BURNER_OUTPUT_OUTPUTS_QUOTED += \
"blink_int.obj.s19" \

BURNER_OUTPUT_OUTPUTS_OS_FORMAT += \
blink_int.obj.s19 \


# All Target
call-burner := 0
ifneq ($(strip $(EXECUTABLES)),)
ifneq ($(strip $(BBL_SRCS_QUOTED)),)
call-burner := 1
endif
endif
ifeq ($(call-burner),1)
all: blink_int.obj blink_int.obj.s19
else
all: blink_int.obj
endif

# Tool invocations
blink_int.obj: $(ASM_SRCS)
	@echo 'Building target: $@'
	@echo 'Executing target #2 $@'
	@echo 'Invoking: HCS08 Assembler'
	"$(HC08ToolsEnv)/ahc08" -Objn"blink_int.obj" -ArgFile"blink_int.args" $(ASM_SRCS_QUOTED) $(ASM_SRCS_QUOTED)
	@echo 'Finished building target: $@'
	@echo ' '

blink_int.obj.s19: $(BBL_SRCS) $(EXECUTABLES)
	@echo 'Executing target #3 $@'
	@echo 'Invoking: S08 Burner'
	"$(HC08ToolsEnv)/burner" -ArgFile"blink_int.obj.args" -f="$<" -env"ABS_FILE=$(strip $(EXECUTABLES_OS_FORMAT))"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(S_DEPS_QUOTED) "./*/*.d"  $(BURNER_OUTPUT_OUTPUTS_QUOTED) $(ASM_UPPER_DEPS_QUOTED) "./*/*.obj"  $(EXECUTABLES_QUOTED) $(S_UPPER_DEPS_QUOTED) $(ProjDirPath)/FLASH/blink_int.obj $(ProjDirPath)/FLASH/blink_int.args $(ProjDirPath)/FLASH/blink_int.obj.args $(ProjDirPath)/FLASH/blink_int.obj.s19 $(ProjDirPath)/FLASH/blink_int.sx
	-@echo ' '

.PHONY: all clean dependents explicit-dependencies warning-messages
.SECONDARY:

-include ../makefile.targets

explicit-dependencies: 

warning-messages: 

