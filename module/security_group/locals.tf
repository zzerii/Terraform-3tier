locals {
    id_map = zipmap("${var.rules_list}", "${var.sg_id}")
}

