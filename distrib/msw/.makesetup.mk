
SRC=$(WXWIN)/include/wx/msw/setup.h
DIR=$(WXWIN)/lib
FILES=	$(DIR)/vc_dll/mswd/wx/setup.h \
        $(DIR)/vc_dll/mswh/wx/setup.h \
        $(DIR)/vc_dll/mswud/wx/setup.h \
        $(DIR)/vc_dll/mswuh/wx/setup.h \
        $(DIR)/vc_dll/msw/wx/setup.h \
        $(DIR)/vc_dll/mswu/wx/setup.h \
	\
        $(DIR)/vc_lib/msw/wx/setup.h \


UNI_SEDCMD=sed "s!wxUSE_UNICODE 0!wxUSE_UNICODE 1!g;s!wxUSE_UNICODE_MSLU 0!wxUSE_UNICODE_MSLU 1!g"
HYB_SEDCMD=sed "s!wxUSE_MEMORY_TRACING 1!wxUSE_MEMORY_TRACING 0!g;s!wxUSE_DEBUG_CONTEXT 1!wxUSE_DEBUG_CONTEXT 0!g"

all : $(FILES)

test :
	echo $(DIR)\vc_lib\msw\wx\setup.h

# debug
$(DIR)\vc_dll\mswd\wx\setup.h : $(SRC) .makesetup.mk
	cat $(SRC) > setup.h.tmp
	mv setup.h.tmp $@

# hybrid
$(DIR)\vc_dll\mswh\wx\setup.h : $(SRC) .makesetup.mk
	cat $(SRC) | $(HYB_SEDCMD) > setup.h.tmp
	mv setup.h.tmp $@

# release
$(DIR)\vc_dll\msw\wx\setup.h : $(SRC) .makesetup.mk
	cat $(SRC) > setup.h.tmp
	mv setup.h.tmp $@

$(DIR)\vc_lib\msw\wx\setup.h : $(SRC) .makesetup.mk
	cat $(SRC) > setup.h.tmp
	mv setup.h.tmp $@

# debug-uni
$(DIR)\vc_dll\mswud\wx\setup.h : $(SRC) .makesetup.mk
	cat $(SRC) | $(UNI_SEDCMD) > setup.h.tmp
	mv setup.h.tmp $@

# hybrid-uni
$(DIR)\vc_dll\mswuh\wx\setup.h : $(SRC) .makesetup.mk
	cat $(SRC) | $(UNI_SEDCMD) | $(HYB_SEDCMD) > setup.h.tmp
	mv setup.h.tmp $@

# release-uni
$(DIR)\vc_dll\mswu\wx\setup.h : $(SRC) .makesetup.mk
	cat $(SRC) | $(UNI_SEDCMD) > setup.h.tmp
	mv setup.h.tmp $@



