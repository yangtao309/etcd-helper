#
# Copyright 2010 Vincent Driessen. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#    1. Redistributions of source code must retain the above copyright notice,
#       this list of conditions and the following disclaimer.
#
#    2. Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY VINCENT DRIESSEN ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL VINCENT DRIESSEN OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
# OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# The views and conclusions contained in the software and documentation are
# those of the authors and should not be interpreted as representing official
# policies, either expressed or implied, of Vincent Driessen.
#

prefix=/usr/local
srcdir= .

# files that need mode 755
EXEC_FILES=etcd

# files that need mode 644
SCRIPT_FILES+=etcd-version
SCRIPT_FILES+=etcd-add
SCRIPT_FILES+=etcd-copy
SCRIPT_FILES+=etcd-update
SCRIPT_FILES+=etcd-delete
SCRIPT_FILES+=etcd-common
SCRIPT_FILES+=etcd-shFlags


all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	@test -f etcd-shFlags || (echo "Run 'etcd submodule init && etcd submodule update' first." ; exit 1 )
	cp -r $(srcdir)/shFlags $(prefix)/bin/shFlags
	install -d -m 0755 $(prefix)/bin
	install -m 0755 $(EXEC_FILES) $(prefix)/bin
	install -m 0644 $(SCRIPT_FILES) $(prefix)/bin
	sed -i "s%{etcd_shell_version}%`cat VERSION`%g" $(prefix)/bin/etcd-version

uninstall:
	test -d $(prefix)/bin && \
	rm -rf $(prefix)/bin/shFlags
	cd $(prefix)/bin && \
	rm -f $(EXEC_FILES) $(SCRIPT_FILES)
